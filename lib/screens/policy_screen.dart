import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../models/policy_model.dart';
import '../services/policy_service.dart';
import '../widgets/policy_card.dart';
import '../widgets/bottom_nav_bar.dart';

class PoliciesScreen extends StatefulWidget {
  const PoliciesScreen({super.key});

  @override
  _PoliciesScreenState createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  int _currentIndex = 1;
  late Future<List<Policy>> _futurePolicies;
  final JsonPolicyService _policyService = JsonPolicyService();

  @override
  void initState() {
    super.initState();
    _futurePolicies = _policyService.loadPolicies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: FadeInDown(
          duration: const Duration(milliseconds: 300),
          child: AppBar(
            title: const Text(
              'My Policies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            scrolledUnderElevation: 0,
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black87),
          ),
        ),
      ),
      body: FutureBuilder<List<Policy>>(
        future: _futurePolicies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(Color(0xFF002C5F)),
              ),
            );
          } else if (snapshot.hasError) {
            return ElasticIn(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline,
                        size: 48, color: Colors.grey[400]),
                    const SizedBox(height: 16),
                    Text(
                      'Unable to load policies',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _futurePolicies = _policyService.loadPolicies();
                        });
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return FadeIn(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.assignment_outlined,
                      size: 48,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No policies found',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return RefreshIndicator.adaptive(
            displacement: 40,
            color: const Color(0xFF002C5F),
            onRefresh: () async {
              setState(() {
                _futurePolicies = _policyService.loadPolicies();
              });
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return SlideInUp(
                  duration: Duration(milliseconds: 300 + (index * 100)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: PolicyCard(policy: snapshot.data![index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
