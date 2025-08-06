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
  }

  void dispose() {
    git.dispose();
    pwsh.dispose();
  }

  // Example:
  // Future<String?> getGitVersion() async {
  //   // This would require GitHandler to have a method like getCurrentVersion()
  //   // return await git.getCurrentVersion();
  // }
}
