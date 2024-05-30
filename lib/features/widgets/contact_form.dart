import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/constants.dart';

class AnimatedInputField extends StatefulWidget {
  final String labelText;
  final Function(String?) onSaved;
  final String? Function(String?)? validator;
  final int maxLines;

  const AnimatedInputField({
    Key? key,
    required this.labelText,
    required this.onSaved,
    this.validator,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  _AnimatedInputFieldState createState() => _AnimatedInputFieldState();
}

class _AnimatedInputFieldState extends State<AnimatedInputField> with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(color: Colors.grey), // Grey placeholder text
            fillColor: Colors.white,
            filled: true,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey), // Grey bottom border
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent), // Remove the default focused border
            ),
          ),
          validator: widget.validator,
          onSaved: widget.onSaved,
          maxLines: widget.maxLines,
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              height: 2.0,
              width: _animation.value * MediaQuery.of(context).size.width,
              color: const Color(0xFF55bbae),
            );
          },
        ),
      ],
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedInputField(
            labelText: 'Your name',
            onSaved: (value) {
              _name = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          AnimatedInputField(
            labelText: 'E-mail',
            onSaved: (value) {
              _email = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          AnimatedInputField(
            labelText: 'Message',
            onSaved: (value) {
              _message = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
            maxLines: 5,
          ),
          const SizedBox(height: 20.0),
          Center(
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Process the data
                  print('Name: $_name');
                  print('Email: $_email');
                  print('Message: $_message');
                }
              },
              child: const Text('Submit Now'),
            ),
          ),
        ],
      ),
    );
  }
}
