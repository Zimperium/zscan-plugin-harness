# zscan-plugin-harness
## Harness plugin for uploads to zScan

This plugin can be used to upload mobile applications to Zimperium (zScan) to be scanned for vulnerabilities. Using a plugin simplifies integrating mobile application security testing into CI/CD process and enables detection and remediation of vulnerabilities earlier in the application SDLC.

For more information on zScan, please see [Continuous Mobile Application Security Scanning](https://www.zimperium.com/zscan/).

## Prerequisites

1. Zimperium [MAPS](https://www.zimperium.com/mobile-app-protection/) license that includes zScan functionality.
2. API credentials with permissions to upload binaries
3. A valid application binary (.ipa, .apk, etc.), either built by the current pipeline or otherwise accessible by the plugin.

## Parameters
### Mandatory
- server_url: console base URL, e.g., https://ziap.zimperium.com/
- client_id and secret: API credentials that can be obtained from the console. We recommend using Harness [Text Secrets](https://developer.harness.io/docs/platform/secrets/add-use-text-secrets), as this is sensitive information that enables access to vulnerability reports
- input_file: the path to the binary relative to the current workspace
- team_name: name of the team to which this application belongs.  This is required only if submitting the application for the first time; values are ignored if the application already exists in the console and assigned to a team.  If not supplied, the application will be assigned to the 'Default' team
- report_format: the format of the scan report, either 'json' (default) or 'sarif'

### Optional

TBD

## Usage

Please refer to Harness [Drone Plugin Documentation](https://developer.harness.io/docs/continuous-integration/use-ci/use-drone-plugins/run-a-drone-plugin-in-ci) for instructions on using plugins as steps in your Harness pipelines.  You will need the following information:

- A Docker v2 compatible Container Registry. The registry URL is (TBD)
- Image URL: (TBD)
- "Optional Configuration" parameters, as described above.  Please note, that even though the plugin configuration step calls these 'optional', some parameters are mandatory.
