# Overview
The responsibility of this repository is to dynamically generate a github organization,
clone all of the repos' from ibm-garage-ref-storefront github and push them to the new organization that was generated.

- Create your Github Organization i.e `storefront-dev`

- If you will be the only person in the new github organization, then you can run the following script:
    ```bash
    export org={your-github-org-you-created}
    ./run.sh
    ```

- If you have multiple users using the same github organization, you can run the following command, to differentiate the storefront-ms from other users.

    ```bash
    export org={your-github-org-you-created}
    export initials={your-initials}"-"
    ./run.sh
    ```