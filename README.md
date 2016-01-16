# Image Rating

Check it out here: <http://image-rating.herokuapp.com/>

In this project we will be building a social image sharing application where users can upload images for storage and peer review. We will use [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) for image uploads to Amazon S3. We will also be introducing sending email from a rails applications for notifications. We will also be using [Gravatar](http://gravatar.com) to provide user profile images

- As a guest
  - The homepage describes what the product is to entice me to sign up
  - I can sign up with my username, email address, password, and password confirmation
    - When I sign up I should also be signed in
    - If my password and confirmation do not match then I should see an error message.
    - If my email address does not have a `@` I should see an error message
    - If my username is blank I should see an error message
    - If my username or email address is not unique I should see an error message
- As a logged in user
  - I can see a link to add a new photo
    - On the upload page
      - I can click a "Add file" button which allows me to pick a photo from my computer
      - I can optionally add a description to the photo
      - The photo should be associated with my user when it is created
      - If I do not attach an image I should see an error message
      - After the image is uploaded I should be redirect to a product detail page
  - I can see a list of all of my photos on my homepage.
  - I can click on any photo to see the detail page for that photo
    - I can see the description if there is one.
    - I can see a list of comments associated with this photo
    - I should see the total count of thumbs up and thumbs down this photo has received.
    - I should see the username and gravatar photo of the author of the photo
    - If I am the owner of this photo I should see a "DELETE" button, which deletes the photo
  - I can see a link to review photos.
    - When the linked is clicked I should see a random photo
      - I should see an optional comment field
      - I should see three buttons or radio buttons, "Thumbs Up", "Meh", and "Thumbs Down" (required)
      - I should be able to submit the form.
    - I should never see one of my photos
    - I should never see a photo I've reviewed before.
    - When a review is created an email should be sent to the author notifying them that a review has been added
  - I can see a link to view all photos ranked sorted by rating ("Thumbs up" +1, "Meh" 0, "Thumbs down" -1)
    - I can click on any photo to see the photo detail page
  - Any place I can see users username, I can click on their username to view their photos
    - I should be able to click on any photo to see the photo detail page
  - I should see a link to my account
    - I should see my avatar from gravatar.com
      - If I don't have a gravatar photo I should see a default photo
    - I should be able to change my email address
    - I should be able to change notification emails
  - I should see a link to sign out
