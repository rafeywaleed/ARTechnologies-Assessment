import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../widgets/claim_item.dart';

class ClaimsScreen extends StatelessWidget {
  const ClaimsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          title: Text('My Claims'),
          pinned: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              FadeInUp(
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.info_outline, color: Color(0xFF002C5F)),
                            SizedBox(width: 8),
                            Text(
                              'Claims Overview',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          children: [
                            _buildStatCard(
                                'Open Claims', '2', Icons.pending_actions),
                            _buildStatCard('Approved', '5', Icons.check_circle),
                            _buildStatCard(
                                'Pending', '1', Icons.hourglass_bottom),
                            _buildStatCard('Rejected', '0', Icons.cancel),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FadeInUp(
                delay: const Duration(milliseconds: 100),
                child: const Text(
                  'Recent Claims',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SlideInUp(
                child: buildClaimItem(
                  status: 'Approved',
                  statusColor: Colors.green,
                  claimNumber: 'CLM-2023-045',
                  date: 'Oct 15, 2023',
                  amount: '\$1,250.00',
                ),
              ),
              const SizedBox(height: 12),
              SlideInUp(
                delay: const Duration(milliseconds: 50),
                child: buildClaimItem(
                  status: 'Pending',
                  statusColor: Colors.orange,
                  claimNumber: 'CLM-2023-046',
                  date: 'Nov 2, 2023',
                  amount: '\$850.00',
                ),
              ),
              const SizedBox(height: 12),
              SlideInUp(
                delay: const Duration(milliseconds: 100),
                child: buildClaimItem(
                  status: 'Processing',
                  statusColor: Colors.blue,
                  claimNumber: 'CLM-2023-047',
                  date: 'Nov 10, 2023',
                  amount: '\$2,100.00',
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: const Color(0xFFF5F5F5),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 16, color: const Color(0xFF002C5F)),
                const SizedBox(width: 4),
                Text(
                  title,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
