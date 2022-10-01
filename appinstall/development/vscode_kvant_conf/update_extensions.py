#  merge together tmp_exptention.conf and the vscode-extentions.py

if __name__=="__main__":

    new_extentions = []

    # try to get new tmp extention.conf
    try:
        with open("./tmp-extention.conf", 'r') as f:
            new_extentions = f.readlines()
    except FileNotFoundError:
        print("nothing to update.")
        exit(0)

    # read current content of vscode extentions
    with open("./vscode-extensions.conf",'r') as f:
        # ... merge both extentions together
        new_extentions.extend(f.readlines())
        # ... make the entrie unique
        new_extentions = list(set(new_extentions))
        # ... sort them alpahbetically
        new_extentions.sort()

    # wirte merged extentions into the vscode-extentions.conf
    with open("./vscode-extensions.conf",'w') as f:
        lines = "".join([extention for extention in new_extentions])
        f.write(lines)
