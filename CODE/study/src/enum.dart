// Khai báo Enum bên ngoài hàm main
enum UserGroup { guest, member, admin }

void main() {
  var userGroup = UserGroup.admin;

  switch (userGroup) {
    case UserGroup.admin:
      print('Quản trị hệ thống');
      break;
    case UserGroup.member:
      print('Thành viên');
      break;
    case UserGroup.guest:
      print('Khách');
      break;
    default:
      print('Không xác định');
  }
}