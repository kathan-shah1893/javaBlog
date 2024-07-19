# JavaBLog 📝

JavaBLog is a blog application built with Spring MVC for managing and publishing blog posts.

## Features

- ✍️ **Blog Management**: CRUD operations for blog posts, including creation, editing, and deletion.
- 📚 **Category Management**: Organize posts into categories for easier navigation and filtering.
- 🔐 **User Authentication**: Secure login and registration system for authors and administrators.
- 🖼️ **Image Upload**: Ability to upload images for use within blog posts.
- 🌐 **SEO-Friendly URLs**: Clean URLs for posts and categories to improve search engine visibility.
- 📅 **Archive and Search**: Archive view for past posts and search functionality for finding specific content.

## Technologies Used

- **Spring Framework**: Core framework for MVC architecture.
- **Spring MVC**: Model-View-Controller implementation for web applications.
- **Thymeleaf**: Template engine for server-side rendering.
- **Spring Security**: Authentication and authorization framework.
- **MySQL**: Database for storing blog posts, categories, and user information.
- **Bootstrap**: Frontend framework for responsive design (optional).

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/kathan-shah1893/JavaBLog.git
   cd JavaBLog
   ```

2. Set up your MySQL database and update `application.properties` with your database configuration:

   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/javablog_db
   spring.datasource.username=root
   spring.datasource.password=password
   ```

3. Run the application using Maven:

   ```bash
   mvn spring-boot:run
   ```

4. Access the application at `http://localhost:8080/` and start managing your blog!

## Usage

1. Sign up as an author or use the default admin account.
2. Create, edit, or delete blog posts.
3. Manage categories and upload images for your posts.
4. Explore the archive, search for specific posts, and enjoy blogging!

## Contributing

Contributions are welcome! If you'd like to add features, improve existing ones, or fix issues, please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built with Spring MVC, providing a robust foundation for Java web applications.
- Inspired by the need for a customizable and user-friendly blogging platform.


 Happy blogging with JavaBLog! 🚀
