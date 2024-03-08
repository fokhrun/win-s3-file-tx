# Set your variables
$sourcePath = "C:\Users\ahmmu\Documents\codes\win-s3-file-tx\data\"
$bucketName = "test-bucket-misbah"
$destinationKey = "something"

# Iterate through files in the source directory
Get-ChildItem -Path $sourcePath | ForEach-Object {
    # Construct the S3 destination path
    $destinationPath = "s3://$bucketName/$destinationKey/$($_.Name)"
    Write-Output $destinationPath
    # Upload the file to S3 using AWS CLI
    aws s3 cp $_.FullName $destinationPath
}
