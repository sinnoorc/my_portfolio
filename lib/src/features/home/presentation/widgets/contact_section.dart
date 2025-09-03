import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../common_libs.dart';
import '../../../../../gen/fonts.gen.dart';

class ContactSection extends StatefulWidget {
  final Color backgroundColor;
  
  const ContactSection({
    super.key,
    this.backgroundColor = const Color(0xFF0f0f0f),
  });

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        
        return Container(
          height: screenSize.height,
          width: screenSize.width,
          color: widget.backgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 50, 
            vertical: isMobile ? 40 : 80,
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ContactInfo(),
                    const SizedBox(height: 40),
                    Expanded(
                      child: _ContactForm(
                        formKey: _formKey,
                        nameController: _nameController,
                        emailController: _emailController,
                        messageController: _messageController,
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _ContactInfo()),
                    const SizedBox(width: 80),
                    Expanded(
                      child: _ContactForm(
                        formKey: _formKey,
                        nameController: _nameController,
                        emailController: _emailController,
                        messageController: _messageController,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'GET IN TOUCH',
          style: TextStyle(
            fontFamily: FontFamily.helveticaNow,
            fontSize: 80,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 40),
        const Text(
          'Ready to bring your ideas to life? Let\'s collaborate and create something amazing together.',
          style: TextStyle(
            fontFamily: FontFamily.helveticaNow,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xFFF40C3F),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 60),
        _ContactInfoItem(
          icon: '📧',
          label: 'EMAIL',
          value: 'sinnoor.dev@gmail.com',
        ),
        const SizedBox(height: 30),
        _ContactInfoItem(
          icon: '📱',
          label: 'PHONE',
          value: '+1 (555) 123-4567',
        ),
        const SizedBox(height: 30),
        _ContactInfoItem(
          icon: '📍',
          label: 'LOCATION',
          value: 'Available for Remote Work',
        ),
        const SizedBox(height: 60),
        const Text(
          'SOCIAL LINKS',
          style: TextStyle(
            fontFamily: FontFamily.helveticaNow,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            height: 1.2,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _SocialLink(label: 'GitHub', url: 'github.com/sinnoorc'),
            const SizedBox(width: 30),
            _SocialLink(label: 'LinkedIn', url: 'linkedin.com/in/sinnoorc'),
            const SizedBox(width: 30),
            _SocialLink(label: 'Twitter', url: 'twitter.com/sinnoorc'),
          ],
        ),
      ],
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const _ContactInfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          icon,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontFamily: FontFamily.helveticaNow,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white54,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontFamily: FontFamily.helveticaNow,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialLink extends StatelessWidget {
  final String label;
  final String url;

  const _SocialLink({
    required this.label,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: FontFamily.helveticaNow,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFFF40C3F),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          url,
          style: const TextStyle(
            fontFamily: FontFamily.helveticaNow,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

class _ContactForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;

  const _ContactForm({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 140), // Align with title
          const Text(
            'SEND A MESSAGE',
            style: TextStyle(
              fontFamily: FontFamily.helveticaNow,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 40),
          _FormField(
            controller: nameController,
            label: 'NAME',
            hint: 'Your full name',
          ),
          const SizedBox(height: 24),
          _FormField(
            controller: emailController,
            label: 'EMAIL',
            hint: 'your.email@example.com',
          ),
          const SizedBox(height: 24),
          _FormField(
            controller: messageController,
            label: 'MESSAGE',
            hint: 'Tell me about your project...',
            maxLines: 6,
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Handle form submission
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Message sent! I\'ll get back to you soon.'),
                      backgroundColor: Color(0xFFF40C3F),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF40C3F),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'SEND MESSAGE',
                style: TextStyle(
                  fontFamily: FontFamily.helveticaNow,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final int maxLines;

  const _FormField({
    required this.controller,
    required this.label,
    required this.hint,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: FontFamily.helveticaNow,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white54,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(
            fontFamily: FontFamily.helveticaNow,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.white38,
              fontFamily: FontFamily.helveticaNow,
            ),
            filled: true,
            fillColor: const Color(0xFF1a1a1a),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFF40C3F)),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            if (label == 'EMAIL' && !value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
      ],
    );
  }
}