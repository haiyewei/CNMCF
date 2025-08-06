import 'git/git_handler.dart';
import 'pwsh/pwsh_handler.dart';

class ExecutableService {
  late final GitHandler git;
  late final PwshHandler pwsh;

  ExecutableService() {
    git = GitHandler();
    pwsh = PwshHandler();
  }

  Future<void> init() async {
    await git.init();
    await pwsh.init();
    // TODO: Add other initialization logic for ExecutableService if needed
  }

  void dispose() {
    git.dispose();
    pwsh.dispose();
    // TODO: Add other cleanup logic for ExecutableService if needed
  }

  // TODO: Implement methods that might route to or use git or pwsh handlers
  // Example:
  // Future<String?> getGitVersion() async {
  //   // This would require GitHandler to have a method like getCurrentVersion()
  //   // return await git.getCurrentVersion();
  // }
}
