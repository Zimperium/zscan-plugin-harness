# zscan-plugin-harness

## Harness plugin for uploads to zScan

This plugin can be used to upload mobile applications to Zimperium (zScan) to be scanned for vulnerabilities. Using a plugin simplifies integrating mobile application security testing into CI/CD process and enables detection and remediation of vulnerabilities earlier in the application SDLC.

For more information on zScan, please see [Continuous Mobile Application Security Scanning](https://www.zimperium.com/zscan/).

## Prerequisites

1. Zimperium [MAPS](https://www.zimperium.com/mobile-app-protection/) license that includes zScan functionality.
2. A valid application binary (.ipa, .apk, etc.), either built by the current pipeline or otherwise accessible by the plugin.
3. API credentials with permissions to upload binaries. In your console, head over to the Authorizations tab in the Account Management section and generate a new API key. At a minimum, the following permissions are required:

- Common Section: Teams - Manage
- zScan Section: zScan Apps - Manage, zScan Assessments - View, zScan Builds - Upload

## Parameters

### Mandatory

These parameters are mandatory, unless a default value is available as described below.

- **server_url**: console base URL, e.g., `https://ziap.zimperium.com/`
- **client_id** and **client_secret**: API credentials that can be obtained from the console. We recommend using Harness [Text Secrets](https://developer.harness.io/docs/platform/secrets/add-use-text-secrets), as this is sensitive information that enables access to vulnerability reports
- **input_file**: the path to the binary relative to the current workspace
- **team_name**: name of the team to which this application belongs.  This is required only if submitting the application for the first time; values are ignored if the application already exists in the console and assigned to a team.  If not supplied, the application will be assigned to the 'Default' team
- **report_format**: the format of the scan report, either 'json' (default) or 'sarif'. For more information on the SARIF format, please see [OASIS Open](https://docs.oasis-open.org/sarif/sarif/v2.1.0/sarif-v2.1.0.html).

### Optional

These parameters are optional, but may be used to supply additional information about the build and/or control the plugin's output.

- **report_location**: destination folder for the vulnerability report. If not provided, the report is stored in the current workspace.
- **report_file_name**: filename of the report. If not provided, the filename will be patterned as follows: zscan-results-AssessmentID-report_format.json, e.g., *zscan-results-123456789-sarif.json*.
- **wait_for_report**: if set to "true" (default), the script will wait for the assessment report to be complete. Otherwise, the script will exit after uploading the binary to zScan. The assessment report can be obtained through the console. Report filename and location parameters are ignored.
- **polling_interval**: wait time for polling the server in seconds. 30 seconds is the default.
- **branch**: source code branch that the build is based on.
- **build_number**: application build number.
- **environment**: target environment, e.g., uat, dev, prod.

## Usage

Please refer to Harness [Drone Plugin Documentation](https://developer.harness.io/docs/continuous-integration/use-ci/use-drone-plugins/run-a-drone-plugin-in-ci) for instructions on using plugins as steps in your Harness pipelines.  You will need to provide the following information:

- A Docker v2 compatible Container Registry. The registry URL is (TBD)
- Image URL: (TBD)
- "Optional Configuration" parameters, as described above.  Please note, that even though the plugin configuration step calls these 'optional', some parameters are mandatory, as described above.

## License

This plugin is licensed under the MIT License. By using this plugin, you agree to the following terms:

```text
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Enhancements

Submitting improvements to the plugin is welcomed and all pull requests will be approved by Zimperium after review.
