import 'package:hive/hive.dart';
import 'package:vcard/vcard.dart';

part 'person-contact_model.g.dart';

@HiveType(typeId: 0)
class PersonContact extends HiveObject {
  @HiveField(0) String note;
  @HiveField(1) String email;
  @HiveField(2) String contact;
  @HiveField(3) String address;
  @HiveField(4) String lastName;
  @HiveField(5) String firstName;
  @HiveField(6) String organization;

  PersonContact({
    this.note,
    this.email,
    this.contact,
    this.address,
    this.lastName,
    this.firstName,
    this.organization
  });

  factory PersonContact.fromVCard(VCard vCard) {
    return PersonContact(
      note: vCard.note,
      email: vCard.email,
      contact: vCard.cellPhone,
      address: vCard.homeAddress.label,
      lastName: vCard.lastName,
      firstName: vCard.firstName,
      organization: vCard.organization
    );
  }

  VCard toVCard() {
    return VCard()
      ..note = note
      ..email = email
      ..cellPhone = contact
      ..homeAddress = (MailingAddress('HOME')..label = address)
      ..lastName = lastName
      ..firstName = firstName
      ..organization = organization;
  }
}