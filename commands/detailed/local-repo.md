# Local Repo From DvD or ISO Image

- This is used in offline environments or secure networks (no internet)

# Configuration Steps

    Step-1. Attach or Mount the ISO / DVD
            lsblk

    Step-2. Copy the Repo Contents (Optional but Recommended, it is to keep using localrepo even when dvd/iso is un-mounted later.)
            sudo cp -rv /mnt/iso/BaseOS/* /repo/BaseOS/
            sudo cp -rv /mnt/iso/AppStream/* /repo/AppStream/

    Step-3. Create and Configure Local Repo File
            /etc/yum.repos.d/local.repo
            sudo nano /etc/yum.repos.d/local.repo
            ```
                [BaseOS]
                name=BaseOS Local Repository
                baseurl=file:///mnt/iso/BaseOS/
                enabled=1
                gpgcheck=1
                gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release

                [AppStream]
                name=AppStream Local Repository
                baseurl=file:///mnt/iso/AppStream/
                enabled=1
                gpgcheck=1
                gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release

            ```
            (baseurl=file:/// → local path)

    Step-4. Clean and Refresh Repository Cache
            sudo dnf clean all
            sudo dnf makecache

    Step-5. Test Your Local Repository
            dnf repolist
