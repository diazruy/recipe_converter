# Recipe Converter

Convert from Menu Planner XML to Food Planner JSON

## Usage

1. Create a `.env` file with Gmail credentials:

    ```
    GMAIL_USER=xxxx # email address to check for MenuPlanner emails
    GMAIL_PASSWORD=xxxx
    FROM_EMAIL=xxxxx  # email address from where the MenuPlanner attachments will be sent
    ```

1. In MenuPlanner, send recipes **as attachment** to the GMail account configured in `.env`
1. Run the rake task to download all emails with MenuPlanner attachments

    ```
    bundle exec foreman run rake
    ```

1. Upload the `foodplanner.backup.txt` file to the root folder of your phone
1. In FoodPlanner, select "Restore backup"

