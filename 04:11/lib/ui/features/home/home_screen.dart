import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zapizapi/ui/widgets/custom_input.dart';
import 'package:zapizapi/utils/routes_enum.dart';

// TODO: Implementar controle de sessão
// TODO: Melhorar Arquitatura com viewmodels e services

/// Tela inicial após o login bem-sucedido
class HomeScreen extends StatefulWidget {
  /// Construtor da classe [HomeScreen]
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: const Color(0xFF03A9F4),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final navigator = Navigator.of(context);
              await Supabase.instance.client.auth.signOut();
              await navigator.pushReplacementNamed(
                RoutesEnum.login.route,
              );
            },
          ),
        ],
      ),
      body: ColoredBox(
        color: const Color.fromARGB(255, 187, 221, 237),
        child: Column(
          children: [
            const ChatComponent(),
            InputComponent(controller: _textController),
          ],
        ),
      ),
    );
  }
}

/// Componente de chat
class ChatComponent extends StatefulWidget {
  /// Construtor da classe [ChatComponent]
  const ChatComponent({super.key});

  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client
          .from('chatRoom')
          .stream(primaryKey: ['id']),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const Expanded(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (asyncSnapshot.hasError) {
          return Expanded(
            child: Center(child: Text('Erro: ${asyncSnapshot.error}')),
          );
        }

        if (!asyncSnapshot.hasData || asyncSnapshot.data!.isEmpty) {
          return const Expanded(
            child: Center(child: Text('Nenhuma mensagem disponível')),
          );
        }

        final messages = asyncSnapshot.data!;

        return Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment:
                      messages[index]['from_id'] ==
                          Supabase.instance.client.auth.currentUser!.id
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(messages[index]['content'] as String),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

/// Componente de entrada
class InputComponent extends StatefulWidget {
  /// Construtor da classe [InputComponent]
  const InputComponent({required this.controller, super.key});

  /// Controlador de texto
  final TextEditingController controller;

  @override
  State<InputComponent> createState() => _InputComponentState();
}

class _InputComponentState extends State<InputComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: CustomInput(
              label: '',
              hint: 'Digite sua mensagem',
              controller: widget.controller,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () async {
              // Lógica para enviar a mensagem
              final content = widget.controller.text;
              debugPrint(
                'user data: '
                '${Supabase.instance.client.auth.currentUser}',
              );
              if (content.isNotEmpty) {
                await Supabase.instance.client.from('chatRoom').insert({
                  'content': content,
                  'from_id': Supabase.instance.client.auth.currentUser!.id,
                  'from_name': Supabase
                      .instance
                      .client
                      .auth
                      .currentUser!
                      .userMetadata?['full_name'],
                });
                widget.controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
