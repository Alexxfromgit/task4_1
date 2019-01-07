# task4_1

General requirements:

    1. The newly installed VM from this image will be used for verification - https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img
    2. To perform it is allowed to install any additional packages. In the case of packages that are not installed in the image, it is necessary to provide for their installation.
    3. Running scripts during the project will be performed as root.

**Task 4.1 - Collecting information about the system.**

Job condition:

Create the bash script ‘task4_1.sh’ that collects basic information about the hardware, operating system, and network interface configuration. As a result of executing this script, you need to create a file ‘task4_1.out’ of the following content:

    --- Hardware ---
    CPU: Intel xeon 2675
    RAM: xxxx 
    Motherboard: XXX XX / Unknown (here use the baseboard-manufacturer
    and baseboard-product-name output. If there is no information - output will be 'Unknown')
    System Serial Number: XXXXXX (this implies dmidecode -s system-serial-number output)
    --- System ---
    OS Distribution: xxxxx (example: Ubuntu 16.04.4 LTS)
    Kernel version: xxxx (example: 4.4.0-116-generic)
    Installation date: xxxx
    Hostname: yyyyy
    Uptime: XX days
    Processes running: 56684
    Users logged in: 665
    --- Network ---
    <Iface #1 name>:  IP/mask
    <Iface #2  name>:  IP/mask
    …
    <Iface #N  name>:  IP/mask

Additional requirements:

    1. The bash script must have the same name of the task ‘task4_1.sh’.
    2. The bash script ‘task4_1.sh’ should be uploaded to the githab repository with the name ‘task4_1’.
    3. The results of the script should be written in the file ‘task4_1.out’.
    4. In the ‘task4_1.out’ file, the specified sections (ie, Hardware, System, Network) and the corresponding parameters should follow strictly in the specified order.
    5. The script should correctly collect information about the configuration of the network interfaces of the system, regardless of their number. For each interface, the IP address and network mask information should be displayed. If the interface is not configured with an IP address then output in the corresponding line must looks like “-”.

Check results:

    • For each launch, a separate VM will be used (OS ubuntu xenial 16.04 server, image). Those. Consider that nobody has configured anything before you. The script will be launched from under the superuser (root). VM has access to the Internet.
    • The VM will have a repository with a task (for example, https://github.com/user/task4_1), if the repository has a different name, then the task will be automatically marked as not executed.
    • The script ‘task4_1.sh’ from the root folder of the repository will automatically run (if the script is named differently or is in a subfolder, it will not be launched, respectively, the task will be automatically marked as unfulfilled).
    • The result of the execution should be recorded in the same folder where the running script is and have the name ‘task4_1.out’. If the output file is created in a different place, or has a name other than ‘task4_1.out’, the task will be automatically marked as unfulfilled.
    • The ‘task4_1.out’ file must match the specified structure. If you have extra blank lines (for example, between the CPU and RAM), the syntax check will return an error and the task will be automatically marked as unfulfilled.
    • Field validation:
        ◦ СPU: one line. Must contain the processor manufacturer and model. Additional information is allowed: frequency, number of cores, symbols (R), etc.
        ◦ RAM: expected string containing numbers and units of measure (KB, MB, GB - in upper case), a space between the value and units of measurement is allowed: 45600KB, 512 MB, etc. 100% compliance with physical memory is not necessary (for example, the part of memory allocated for video can be ignored)
        ◦ Motherboard: manufacturer (optional) and motherboard model. If this data could not be obtained, the script should output Unknown.
            ▪ Motherboard: ASUSTeK COMPUTER INC. P8Z77-M PRO
            ▪ Motherboard: P8Z77-M PRO
            ▪ Motherboard: ASUSTeK COMPUTER INC. Unknown
            ▪ Motherboard: Unknown
        ◦ System Serial Number: must contain the System Serial Number. If this parameter cannot be obtained, the script should display Unknown.
            ▪ System Serial Number: S15747127820237
            ▪ System Serial Number: Unknown
        ◦ OS Distribution: must contain information about the distribution vendor, its version and, optionally, the distribution code name. One line, spaces, numbers, upper and lower case letters are allowed.
        ◦ Kernel version: must contain a kernel version. One line, no spaces.
        ◦ Installation date: estimated installation time. Date format requirements: human-readable and should be recognized as correct with the command “date -d <date>”. For example:
            ▪ Installation date: Tue Mar 27 14:40:35 UTC 2018
            ▪ Installation date: 03/27/2018
            ▪ Installation date: Mar 27 2018
        ◦ Hostname: FQDN VM. One line, no spaces. Valid characters are a-z, a-z, 0-9, hyphen and periods.
        ◦ Uptime: how much time has passed since the last run up to the minute. The string must contain only numbers, spaces, the words “weeks”, “days”, “hours”, “minutes” and commas. Example output format:
            ▪ Uptime: 2 minutes
            ▪ Uptime: 5 weeks, 4 days, 2 hours, 25 minutes
            ▪ Uptime: 5 hours 2 minutes
        ◦ Processes running: the number of processes present in the system at the time the script was run. May contain only numbers. The script process and all its children (if any) must also be taken into account.
        ◦ Users logged in: the number of users who have unclosed sessions at the time of the script launch. Number.
        ◦ Displays network interface settings. May contain several lines. For each network interface (including loopback, vlan, tap, etc.), the system must have configured IPv4 network addresses in A.B.C.D / MASK format. If the interface does not have the assigned IP address of the quarter version, a hyphen (“-”) must be specified. For each interface, the line with the address can contain only numbers, periods, spaces, the characters “/” and “-” and commas. For example:
    --- NETWORK ---
    lo: 127.0.0.1/8
    enp0s3: 192.168.1.37/24, 10.255.215.47/8
    virbr0: 192.168.122.1/24
    virbr0-nic: -
    • For all items, the required output format is <parameter name> <colon> <space> <collected data>. If there are more than one space after the colon, the file ‘task4_1.out’ will not pass the syntax check and the task will be marked as failed. If the name of the required field is written in a format other than the one suggested (including case sensitive), the same thing happens. If in the points where the set of allowed characters is strictly stipulated, there are unresolved characters, the task will be considered as not fulfilled.
    • The script can be run several times in a row. After each restart, a check of the ‘task4_1.out’ file for compliance with the specified pattern will be performed.
