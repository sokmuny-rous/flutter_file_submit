import 'package:flutter/material.dart';

enum WorkStatus { all, turnIn, assigned }

class ViewWorkDetail extends StatefulWidget {
  const ViewWorkDetail({super.key});

  @override
  State<ViewWorkDetail> createState() => _ViewWorkDetailState();
}

class _ViewWorkDetailState extends State<ViewWorkDetail> {
  WorkStatus status = WorkStatus.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildStatusTabs(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildCard(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTabs() {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: _buildTab("All", WorkStatus.all)),
          const SizedBox(width: 12),
          Expanded(child: _buildTab("Turn in", WorkStatus.turnIn)),
          const SizedBox(width: 12),
          Expanded(child: _buildTab("Assigned", WorkStatus.assigned)),
        ],
      ),
    );
  }

  Widget _buildTab(String label, WorkStatus tabStatus) {
    bool selected = status == tabStatus;

    return GestureDetector(
      onTap: () {
        setState(() {
          status = tabStatus;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          boxShadow: selected
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "1",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.black : Colors.grey[400],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: selected ? Colors.black : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Group 3",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          _buildStudentRow(),
          const SizedBox(height: 24),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildStudentRow() {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey[400],
          child: const Icon(Icons.person, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            "Chamrong Raksa",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        Text(
          _getStatusText(),
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  String _getStatusText() {
    switch (status) {
      case WorkStatus.all:
        return "Jan 2, 2026";
      case WorkStatus.turnIn:
        return "turned in";
      case WorkStatus.assigned:
        return "assigned";
    }
  }

  Widget _buildBottomSection() {
    switch (status) {
      case WorkStatus.all:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Dear teacher this is group 3 homework.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[400]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'file',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ],
            ),
          ],
        );

      case WorkStatus.turnIn:
        return Row(
          children: [
            Expanded(
              child: _scoreBox("__ / 10"),
            ),
            const SizedBox(width: 12),
            _actionButton("Assign"),
          ],
        );

      case WorkStatus.assigned:
        return Row(
          children: [
            Expanded(
              child: _scoreBox("10 / 10"),
            ),
            const SizedBox(width: 12),
            _actionButton("Edit"),
          ],
        );
    }
  }

  Widget _scoreBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _actionButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}