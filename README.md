This repository contains a small project, which manipulates albums and photos.

1. Fork the repository.
2. Implement requested functionality.
3. Create a pull request IN YOUR OWN REPOSITORY with a completed task.
4. Let us know

Requirements:
- Restore the database structure and migrations.
- Create an API interface with endpoints, that allow to receive:
    - Albums. With fields: 
        - Album name
        - Amount of photos
        - Album author
        - The date of the last change
    - Photos. With fields:
        - Url
        - Upload date
        - Author
        - Related album

- You can use RailsAPI or Grape + GrapeEntity(more suitable variant)
- API should be protected with any kind of authorization
- Upgrade Rails to version 6
- Upgrade Ruby to version 2.7 
