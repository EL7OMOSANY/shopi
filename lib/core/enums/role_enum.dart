enum AppRole { admin, customer }

extension AppRolePermission on AppRole {
  int get permissionNumber {
    switch (this) {
      case AppRole.admin:
        return 5;
      case AppRole.customer:
        return 3;
    }
  }
}
