# Java3 ASM - Nhóm 3

Dự án là bài tập môn Java 3 sử dụng Servlet, JSP và SQL Server để quản lý tin tức và đăng ký nhận bản tin.

## Yêu cầu môi trường
- **JDK 21** trở lên
- **Apache Maven** 3.9 trở lên
- Máy chủ Servlet (Tomcat 10+ hoặc tương đương)

## Cài đặt
1. Cài JDK và thiết lập biến môi trường `JAVA_HOME`.
2. Cài Maven và kiểm tra bằng `mvn -v`.
3. Tạo cơ sở dữ liệu theo script `j3asm.sql`.

## Build
Chạy lệnh sau ở thư mục gốc để tạo file WAR:

```bash
mvn clean package
```

Sau khi hoàn tất, file `asm.war` nằm trong thư mục `target/`.

## Chạy ứng dụng
Triển khai `asm.war` lên máy chủ Servlet (ví dụ Tomcat 10+), sau đó truy cập `http://localhost:8080/asm`.

## Cấu trúc `src/main/java`
```
src/main/java
├── Controller/   # Các servlet: main, admin, newsletter
├── DAO/          # Lớp DAO chung và các DAO triển khai
├── Entity/       # Đối tượng thực thể (News, Newsletter)
└── Utils/        # Lớp tiện ích (kết nối JDBC)
```
