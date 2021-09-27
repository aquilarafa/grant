# Grant

<p align="center">  
A simple package to control widgets based on user privileges. Choose what users can interact based on plan, roles or any other condition. 
</p>
  
## 🚀 Getting Started
### 1. Add grant to your pubspec.yaml.

```yaml
name: your_flutter_app
dependencies:
  flutter:
    sdk: flutter
  grant:
```

### 2. Create permissions that extends `PermissionBase`

```dart
class CanChat extends PermissionBase {}
class CanCreateTeams extends PermissionBase {}
...
```

### 3. Put GrantAccess somewhere in the widget tree

```dart
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: _navigatorKey,
        title: 'Flutter Demo',
        home: GrantAccess(
          child: YourApp()
        ),
    );
  }
}
```

### 4. Use GrantAccess.storeOf to update your user permissions

From anywhere in your app

```dart
...
 GrantAccess.storeOf(context).updatePermissions(permissions);
```

## 5. Enable or disable features using these widgets

```dart
Center(
    child: CanSee(
    permissions: [CanChat()],
    child: ChatButton()
  ),
)
```

`CanSee` will show the `child` only if user's current permission matches `permissions`.

```dart
Center(
    child: CanConsume(
    permissions: [CanCreateTeams()],
    builder: (context, bool allowed){
        return allowed ? CreateTeamButton() : OtherWidget()
    }
  ),
)
```

`CanConsume` gives a bool `allowed` using a `builder`.
