import 'dart:convert';
// {user_id: 76, fname: Abdul-Rafik, lname: Adam, username: AA900, phone: 0550450337, email: adamabdulrafik1@gmail.com, user_bio: I am a software Developer,
//storename: Softstore, identity_card: assets/uploads/identity/665c312b25168.jpg, profile_picture: assets/uploads/profiles/665c312b25168.jpg|,
//banner_url: null, city: Tamale, state: Northern, zip: NT0129, address1: NT-0129-5010, address2: KU69,
//user_type: admin, verified: true, user_status: approved, joined_on: 2024-06-02 08:45:31}

class UserModel {
  final int user_id;
  final String fname;
  final String lname;
  final String username;
  final String phone;
  final String email;
  final String user_bio;
  final String storename;
  final String identity_card;
  final String profile_picture;
  final String banner_url;
  final String city;
  final String state;
  final String zip;
  final String address1;
  final String address2;
  final String user_type;
  final bool verified;
  final String user_status;
  final String joined_on;

  UserModel(
    this.user_id,
    this.fname,
    this.lname,
    this.username,
    this.phone,
    this.email,
    this.user_bio,
    this.storename,
    this.identity_card,
    this.profile_picture,
    this.banner_url,
    this.city,
    this.state,
    this.zip,
    this.address1,
    this.address2,
    this.user_type,
    this.verified,
    this.user_status,
    this.joined_on,
  );

  UserModel copyWith({
    int? user_id,
    String? fname,
    String? lname,
    String? username,
    String? phone,
    String? email,
    String? user_bio,
    String? storename,
    String? identity_card,
    String? profile_picture,
    String? banner_url,
    String? city,
    String? state,
    String? zip,
    String? address1,
    String? address2,
    String? user_type,
    bool? verified,
    String? user_status,
    String? joined_on,
  }) {
    return UserModel(
      user_id ?? this.user_id,
      fname ?? this.fname,
      lname ?? this.lname,
      username ?? this.username,
      phone ?? this.phone,
      email ?? this.email,
      user_bio ?? this.user_bio,
      storename ?? this.storename,
      identity_card ?? this.identity_card,
      profile_picture ?? this.profile_picture,
      banner_url ?? this.banner_url,
      city ?? this.city,
      state ?? this.state,
      zip ?? this.zip,
      address1 ?? this.address1,
      address2 ?? this.address2,
      user_type ?? this.user_type,
      verified ?? this.verified,
      user_status ?? this.user_status,
      joined_on ?? this.joined_on,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'fname': fname,
      'lname': lname,
      'username': username,
      'phone': phone,
      'email': email,
      'user_bio': user_bio,
      'storename': storename,
      'identity_card': identity_card,
      'profile_picture': profile_picture,
      'banner_url': banner_url,
      'city': city,
      'state': state,
      'zip': zip,
      'address1': address1,
      'address2': address2,
      'user_type': user_type,
      'verified': verified,
      'user_status': user_status,
      'joined_on': joined_on,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      int.parse(map['user_id']),
      map['fname'] ?? '',
      map['lname'] ?? '',
      map['username'] ?? '',
      map['phone'] ?? '',
      map['email'] ?? '',
      map['user_bio'] ?? '',
      map['storename'] ?? '',
      map['identity_card'] ?? '',
      map['profile_picture'] ?? '',
      map['banner_url'] ?? '',
      map['city'] ?? '',
      map['state'] ?? '',
      map['zip'] ?? '',
      map['address1'] ?? '',
      map['address2'] ?? '',
      map['user_type'] ?? '',
      map['verified'] == "true" ? true : false,
      map['user_status'] ?? '',
      map['joined_on'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(user_id: $user_id, fname: $fname, lname: $lname, username: $username, phone: $phone, email: $email, user_bio: $user_bio, storename: $storename, identity_card: $identity_card, profile_picture: $profile_picture, banner_url: $banner_url, city: $city, state: $state, zip: $zip, address1: $address1, address2: $address2, user_type: $user_type, verified: $verified, user_status: $user_status, joined_on: $joined_on)';
  }
}
