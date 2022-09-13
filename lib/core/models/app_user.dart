class AppUser {
  String? appUserId;
  String? userName;
  String? userEmail;
  String? phoneNumber;
  String? fullName;
  String? password;
  String? confirmPassword;
  String? description;
  // bool? isFirstLogin;
  DateTime? createdAt;
  String? imageUrl;
  // String? lastMessage;
  // String? lastMessageAt;
  // int? dayStreak;
  // int? countJournalWords;
  // int? countTotalJournals;
  // bool? makeProfilePrivate;
  // bool? blockUser;
  // String? facebookLink;
  // String? twitterLink;
  // String? instagramLink;
  // String? monthYear;
  // DateTime? lastJournalEntry;
  // int? statusLenghthOfAdminMessages;
  // int? statusLenghOfIndividualMsgs;
  // int? session;
  // int? selfAwarenessSession;
  // int? accountabilitySession;
  // int? growthSession;
  // int? empowermentSession;
  // String? fcmToken;

  AppUser({
    this.appUserId,
    this.userEmail,
    this.userName,
    this.phoneNumber,
    this.description,
    this.fullName,
    this.password,
    this.confirmPassword,
    // this.isFirstLogin,
    this.createdAt,
    this.imageUrl,
    // this.lastMessage,
    // this.lastMessageAt,
    // this.dayStreak,
    // this.countJournalWords,
    // this.countTotalJournals,
    // this.makeProfilePrivate,
    // this.blockUser,
    // this.facebookLink,
    // this.instagramLink,
    // this.twitterLink,
    // this.monthYear,
    // this.lastJournalEntry,
    // this.statusLenghthOfAdminMessages,
    // this.statusLenghOfIndividualMsgs,
    // this.session,
    // this.accountabilitySession,
    // this.empowermentSession,
    // this.growthSession,
    // this.selfAwarenessSession,
    // this.fcmToken,
  });

  AppUser.fromJson(json, id) {
    this.appUserId = id;
    this.userName = json['userName'] ?? '';
    this.userEmail = json['userEmail'];
    this.phoneNumber = json['phoneNumber'] ?? '';
    this.fullName = json['fullName'] ?? '';
    this.description = json['description'] ?? '';
    // this.isFirstLogin = json['isFirstLogin'];
    this.createdAt = json['createdAt'].toDate();
    this.imageUrl = json['imageUrl'];
    // this.lastMessage = json['lastMessage'] ?? '';
    // this.dayStreak = json['dayStreak'] ?? 0;
    // this.lastMessageAt = json['lastMessageAt'] ?? '';
    // this.countJournalWords = json['countJournalWords'];
    // this.countTotalJournals = json['countTotalJournals'];
    // this.makeProfilePrivate = json['makeProfilePrivate'];
    // this.blockUser = json['blockUser'];
    // this.monthYear = json['monthYear'];
    // this.lastJournalEntry = json['lastJournalEntry'].toDate();
    // this.statusLenghthOfAdminMessages = json['statusLenghthOfAdminMessages'];
    // this.statusLenghOfIndividualMsgs = json['statusLenghOfIndividualMsgs'];

    // this.facebookLink = json['facebookLink'] ?? 'https://www.facebook.com/';
    // this.instagramLink = json['instagramLink'] ?? 'https://www.instagram.com/';
    // this.twitterLink = json['twitterLink'] ?? 'https://twitter.com/';
    // this.session = json['session'];
    // this.accountabilitySession = json['accountabilitySession'];
    // this.empowermentSession = json['empowermentSession'];
    // this.growthSession = json['growthSession'];
    // this.selfAwarenessSession = json['selfAwarenessSession'];
    // this.fcmToken = json["fcmToken"];
  }

  toJson() {
    return {
      'appUserId': this.appUserId,
      'userName': this.userName,
      'userEmail': this.userEmail,
      'phoneNumber': this.phoneNumber,
      // 'password': this.password,
      'fullName': this.fullName,
      'description': this.description,
      // 'isFirstLogin': this.isFirstLogin,
      'createdAt': this.createdAt,
      'imageUrl': this.imageUrl,
      // 'lastMessage': this.lastMessage,
      // 'lastMessageAt': this.lastMessageAt,
      // 'dayStreak': this.dayStreak,
      // 'countJournalWords': this.countJournalWords,
      // 'countTotalJournals': this.countTotalJournals,
      // 'makeProfilePrivate': this.makeProfilePrivate,
      // 'blockUser': this.blockUser,
      // 'monthYear': this.monthYear,
      // 'lastJournalEntry': this.lastJournalEntry,
      // 'facebookLink': this.facebookLink,
      // 'instagramLink': this.instagramLink,
      // 'twitterLink': this.twitterLink,
      // 'statusLenghthOfAdminMessages': this.statusLenghthOfAdminMessages,
      // 'statusLenghOfIndividualMsgs': this.statusLenghOfIndividualMsgs,
      // 'session': this.session,
      // 'accountabilitySession': this.accountabilitySession,
      // 'empowermentSession': this.empowermentSession,
      // 'growthSession': this.growthSession,
      // 'selfAwarenessSession': this.selfAwarenessSession,
      // "fcmToken": this.fcmToken,
    };
  }
}
