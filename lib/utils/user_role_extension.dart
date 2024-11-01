enum UserRole {
  ADMIN,
  SUPERUSER,
  RESTAURANT_MANAGER,
  RESTAURANT_OWNER,
  CUSTOMER,
}

extension UserRoleExtension on UserRole {
  static UserRole? fromScopeString(String scopeString) {
    // Remove 'SCOPE_' prefix if present
    String roleString = scopeString.replaceFirst('SCOPE_', '');

    // Match the remaining string to UserRole
    return UserRole.values.firstWhere(
          (role) => role.name == roleString,
    );
  }
}
