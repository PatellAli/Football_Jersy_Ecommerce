# Elite Gear

Elite Gear is a Flutter-based e-commerce application for purchasing football jerseys. The app provides users with a seamless experience to browse, add to cart, and purchase jerseys with secure authentication and multiple payment options.

## Features

### User Interface
- Displays jersey information in a card format.
- Cards include details such as:
  - Price
  - Size
  - Quantity

### User Authentication
- **Supabase Authentication**: Users need to log in or sign up to add items to the cart and make purchases.

### Product Management
- **Supabase Database**: Stores jersey details such as size, price, and quantity.
- **Supabase Storage**: Manages images of football jerseys.

### Cart and Checkout
- Users can add items to the cart.
- At checkout, users are prompted to provide:
  - Phone number
  - Address
  - Email
- Payment options:
  - **Cash on Delivery**
  - **Online Payment** (via GPay or Paytm)

### Order Management
- Once an order is placed:
  - The order information, along with the user's email, is stored in the database.
  - Users can view their order history fetched from the database based on their email.

## Dependencies

The project uses the following dependencies:
- **gnav**: For navigation within the app.
- **supabase**: For database, storage, and authentication services.

## Technology Stack

The app is developed using:
- **Dart**
- **C++**
- **CMake**
- **Swift**
- **C**
- **HTML**
- **Other**

## How It Works

1. **Browsing Jerseys**
   - Users can browse all available football jerseys without logging in.
2. **Adding to Cart**
   - Users must log in or sign up to add items to the cart.
3. **Placing Orders**
   - Users can select a payment method and provide required details.
4. **Order History**
   - Users can view their past orders, fetched from the database based on their email.

## How to Run the App

1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```
2. Navigate to the project directory:
   ```bash
   cd elite_gear
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Screenshots
_Add screenshots of the app here._

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Contact

For queries or suggestions, feel free to reach out:
- Email: [your_email@example.com]
