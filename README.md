# 📚 Online Book Store

A comprehensive Spring Boot web application for managing an online book store with role-based access control for Customers, Sellers, and Administrators.

## ✨ Features

### 🛍️ Customer Features

- **User Management**
  - User registration and secure login
  - Profile management with update capabilities
  - Password change functionality
  - Forgot password recovery

- **Book Browsing & Shopping**
  - Browse books with modern grid layout
  - Advanced search with real-time filtering
  - Category-based filtering
  - Price sorting (Low to High, High to Low)
  - Book detail pages with comprehensive information
  - Quick view modal for fast preview
  - Stock status indicators (In Stock, Low Stock, Out of Stock)

- **Shopping Cart**
  - Add/remove books from cart
  - Quantity selector with real-time updates
  - Visual cart summary with pricing breakdown
  - Responsive cart design
  - Cart counter in navigation

- **Order Management**
  - Secure checkout process
  - Multiple payment options (COD, Online)
  - Order history and tracking
  - Transaction receipts
  - Purchased books library

### 🏪 Seller Features

- **Seller Dashboard**
  - Statistics overview (Total Books, Orders, Revenue)
  - Quick actions panel
  - Business information display
  - Recent books listing

- **Book Management**
  - Add new books with detailed information
  - Edit existing book details
  - Delete books from inventory
  - Increase stock quantity
  - Upload book cover images
  - Real-time character counters for descriptions
  - Form validation with user-friendly error messages

- **Order & Customer Management**
  - View orders for seller's books
  - Track payment status
  - Customer information access
  - Revenue tracking

- **Profile Management**
  - Update business information
  - Change password
  - Manage account settings

### 👨‍💼 Admin Features

- **Dashboard**
  - System-wide statistics
  - User management overview
  - Book inventory overview

- **User Management**
  - View all customers
  - View all sellers
  - Manage user accounts

- **System Monitoring**
  - View all books in the system
  - Monitor transactions
  - Access control management

## 🚀 Recent Improvements (October 2024)

### UI/UX Enhancements
- ✅ Modern, responsive book catalog with hover effects
- ✅ Enhanced shopping cart with quantity selectors
- ✅ Toast notification system (replaces alert dialogs)
- ✅ Loading spinner for async operations
- ✅ Quick view modal for books
- ✅ Custom 404 and 500 error pages
- ✅ Improved form validation with real-time feedback
- ✅ Character counters for text fields
- ✅ Stock badges and indicators
- ✅ Mobile-responsive design throughout

### Technical Improvements
- ✅ Comprehensive error handling
- ✅ Database constraint validation
- ✅ User-friendly error messages
- ✅ Client-side search and filtering
- ✅ Image error handling with fallbacks
- ✅ Accessibility improvements

### New Features
- ✅ Real-time search functionality
- ✅ Category and price filtering
- ✅ Book sharing functionality (Web Share API)
- ✅ Print book details
- ✅ Seller information on book pages
- ✅ Empty state handling
- ✅ Breadcrumb navigation

## 🛠️ Technology Stack

### Backend
- **Java 8**
- **Spring Boot 2.3.1**
- **Spring Security** - Authentication & Authorization
- **Spring Data JPA** - Database ORM
- **Hibernate** - JPA Implementation
- **MySQL** - Relational Database
- **Maven** - Dependency Management

### Frontend
- **JSP** - Server-side rendering
- **HTML5 & CSS3**
- **JavaScript (ES6+) & jQuery**
- **Bootstrap 4** - Responsive framework
- **Font Awesome 6** - Icons
- **DataTables** - Advanced table features
- **SB Admin 2** - Admin template

### Additional Libraries
- **Spring Boot DevTools** - Hot reload
- **Lombok** - Reduce boilerplate code
- **Validation API** - Form validation

## 📋 Prerequisites

- **JDK 1.8+** (Java Development Kit)
- **Maven 3.x** (Build tool)
- **MySQL Server 5.7+** (Database)
- **IDE** (IntelliJ IDEA, Eclipse, or VS Code recommended)

## 🚀 Getting Started

### 1. Clone Repository

```bash
git clone https://github.com/YashasXworkz/online-book-store.git
cd online-book-store
```

### 2. Configure Database

Create a MySQL database and update `application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/bookstore_db
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update
```

### 3. Build Application

```bash
mvn clean install
```

### 4. Run Application

```bash
mvn spring-boot:run
```

Or run the JAR file:

```bash
java -jar target/online-book-store-0.0.1-SNAPSHOT.jar
```

### 5. Access Application

- **URL:** `http://localhost:8082`
- **Default Admin:** (Configure in database)
- **Register** as Customer or Seller to get started

## 📁 Project Structure

```
online-book-store/
├── src/
│   ├── main/
│   │   ├── java/com/shashirajraja/onlinebookstore/
│   │   │   ├── controller/     # REST & MVC Controllers
│   │   │   ├── entity/         # JPA Entities
│   │   │   ├── repository/     # Data Access Layer
│   │   │   ├── service/        # Business Logic
│   │   │   ├── security/       # Security Configuration
│   │   │   └── dto/            # Data Transfer Objects
│   │   ├── resources/
│   │   │   ├── static/         # CSS, JS, Images
│   │   │   │   ├── css/
│   │   │   │   ├── js/
│   │   │   │   └── vendor/
│   │   │   ├── templates/      # Email templates
│   │   │   └── application.properties
│   │   └── webapp/
│   │       └── WEB-INF/
│   │           └── view/       # JSP Pages
│   └── test/                   # Unit & Integration Tests
├── pom.xml                     # Maven Dependencies
├── README.md                   # This file
└── IMPROVEMENTS.md             # Detailed improvement log
```

## 🔐 Security Features

- **Spring Security** integration
- **Role-based access control** (ROLE_CUSTOMER, ROLE_SELLER, ROLE_ADMIN)
- **Password encryption** using BCrypt
- **CSRF protection**
- **Session management**
- **Secure authentication**

## 📱 Responsive Design

The application is fully responsive and works seamlessly on:
- 💻 Desktop (1920px+)
- 💻 Laptop (1366px - 1920px)
- 📱 Tablet (768px - 1366px)
- 📱 Mobile (320px - 768px)

## 🎨 UI Components

### Included JavaScript Utilities
- `toast-notifications.js` - Modern toast notifications
- `loading-spinner.js` - Loading overlay for async operations
- `book-quick-view.js` - Quick view modal for books
- `sb-admin-2.min.js` - Admin template scripts

### CSS Frameworks
- Bootstrap 4.x
- SB Admin 2 Theme
- Custom responsive styles

## 🧪 Testing

```bash
# Run all tests
mvn test

# Run specific test class
mvn test -Dtest=CustomerServiceTest

# Run with coverage
mvn clean test jacoco:report
```

## 📦 Deployment

### Production Build

```bash
mvn clean package -DskipTests
```

### Deploy to Server

1. Copy JAR file to server
2. Configure production database
3. Run with production profile:

```bash
java -jar -Dspring.profiles.active=prod online-book-store.jar
```

## 🐛 Known Issues & Roadmap

See `IMPROVEMENTS.md` for detailed list of:
- Planned features
- Known bugs
- Enhancement requests
- Priority matrix

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Authors

- **Shashi Raj Raja** - Initial work
- **Contributors** - See contributors list

## 📞 Support

For support, email support@bookstore.com or open an issue in the repository.

## 🙏 Acknowledgments

- Spring Boot team for the excellent framework
- Bootstrap team for the responsive framework
- SB Admin 2 for the admin template
- Font Awesome for the icons
- All contributors and testers

---

**Last Updated:** October 24, 2025  
**Version:** 2.0.0  
**Status:** Active Development
