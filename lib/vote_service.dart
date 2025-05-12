class VoteService {
  static final Map<String, String> _votes = {}; // NIS -> Candidate ID

  static bool hasVoted(String nis) => _votes.containsKey(nis);

  static void vote(String nis, String candidateId) {
    if (!hasVoted(nis)) {
      _votes[nis] = candidateId;
    }
  }

  static String? getVote(String nis) => _votes[nis];
}
