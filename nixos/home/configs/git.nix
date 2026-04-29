{ ... }:
{
programs.git = {
        enable = true;
	settings = {
        user.name = "sayavc";
        user.email = "sayme.git@gmail.com";
        init.defaultBranch = "main";
        pull.rebase = false;
        };
    };
}
