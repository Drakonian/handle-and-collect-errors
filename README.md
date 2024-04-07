# How to handle and collect errors in loops. Error log. (NAV/BC)
What if we have a loop in which some actions occur that can cause an error. What if we need to continue iterating through the loop after the errors and save the errors to the log? Today I will show you how this can be done even for transactional operations.

https://vld-nav.com/handle-and-collect-errors

![Error Log](https://static.tildacdn.com/tild6665-3962-4535-b863-333931626362/ErrorLog.gif)

---

# How to Install a Per Tenant Extension (.app file) in Business Central

This guide provides step-by-step instructions for installing a Per Tenant Extension (PTE) `.app` file in Microsoft Dynamics 365 Business Central via the Extension Management page.

## Prerequisites

- **Permissions**: Ensure you have the permissions to manage extensions in Business Central.
- **.app File**: Have the `.app` file you wish to install ready.

## Installation Steps

### 1. Access the Extension Management Page

- Go to **Extension Management** from the Search.

### 2. Upload the Extension

- Click **Upload Extension** on the Extension Management page.
- Press **Select .app file DrillDown**, navigate to your `.app` file, select it, and click **Open**.
  
### 3. Install the Extension

- Click **Deploy**
- Accept any terms and conditions, if prompted.
- Confirm the installation by clicking **Yes**.

### 4. Verify Installation

- The installation process may take a few minutes. You can monitor the progress on the Extension Management page, where the status will change to **Installed** once completed.

## Troubleshooting

- **Installation Errors**: Refer to the error message details and consult the extension's documentation or support resources.
- **Permissions Issues**: Confirm you have the necessary permissions to install extensions. Contact your system administrator if you're unsure.


---
