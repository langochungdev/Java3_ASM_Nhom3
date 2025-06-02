CREATE DATABASE j3asm
GO
USE j3asm
GO

-- Tạo bảng
CREATE TABLE CATEGORIES (
    Id NVARCHAR(50) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
)

CREATE TABLE USERS (
    Id NVARCHAR(50) PRIMARY KEY,
    Password NVARCHAR(100) NOT NULL,
    Fullname NVARCHAR(100) NOT NULL,
    Birthday DATE,
    Gender BIT,
    Mobile NVARCHAR(20),
    Email NVARCHAR(100),
    Role BIT
)

CREATE TABLE NEWS (
    Id NVARCHAR(50) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Content NVARCHAR(MAX) NOT NULL,
    Image NVARCHAR(200),
    PostedDate DATE,
    Author NVARCHAR(50),
    ViewCount INT,
    CategoryId NVARCHAR(50),
    Home BIT,
    FOREIGN KEY (Author) REFERENCES USERS(Id),
    FOREIGN KEY (CategoryId) REFERENCES CATEGORIES(Id)
)

CREATE TABLE NEWSLETTERS (
    Email NVARCHAR(100) PRIMARY KEY,
    Enabled BIT
)

-- Dữ liệu mẫu: CATEGORIES
INSERT INTO CATEGORIES (Id, Name) VALUES
('CAT01', N'Thời sự'),
('CAT02', N'Kinh tế'),
('CAT03', N'Xã hội'),
('CAT04', N'Văn hóa'),
('CAT05', N'Thể thao'),
('CAT06', N'Công nghệ'),
('CAT07', N'Giáo dục'),
('CAT08', N'Giải trí')

-- Dữ liệu mẫu: USERS
INSERT INTO USERS (Id, Password, Fullname, Birthday, Gender, Mobile, Email, Role) VALUES
('USER01', N'pass123', N'Nguyễn Văn A', '1990-01-01', 1, '0912345678', 'nva@gmail.com', 1),
('USER03', N'pass789', N'Lê Văn C', '1988-03-03', 1, '0934567890', 'lvc@gmail.com', 0),
('USER05', N'pass112', N'Hoàng Văn E', '1993-05-05', 1, '0956789012', 'hve@gmail.com', 0),
('USER07', N'pass415', N'Đỗ Văn G', '1989-07-07', 1, '0978901234', 'dvg@gmail.com', 1)

-- Dữ liệu mẫu: NEWS (đã sửa lỗi AUTHOR)
-- Dữ liệu mẫu: NEWS (cập nhật CategoryId, content dài ~50 từ, link ảnh thật)
INSERT INTO NEWS (Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home) VALUES 
('news01', N'5 cách tăng năng suất làm việc mỗi ngày', 
 N'Để tăng năng suất làm việc, bạn cần lên kế hoạch rõ ràng, tập trung cao độ, tránh các yếu tố gây xao nhãng, và luôn giữ tinh thần lạc quan. Hãy thử áp dụng các kỹ thuật Pomodoro và nghỉ ngơi hợp lý để duy trì sự tỉnh táo.', 
 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=120&q=80', '2025-05-01', 'USER01', 120, 'CAT01', 1),

('news02', N'Tại sao nên học lập trình từ sớm?', 
 N'Học lập trình sớm giúp phát triển tư duy logic, giải quyết vấn đề hiệu quả và mở ra nhiều cơ hội nghề nghiệp. Trẻ em và thanh thiếu niên có thể tiếp cận các ngôn ngữ lập trình qua các nền tảng dễ hiểu, từ đó xây dựng nền tảng vững chắc cho tương lai.', 
 'https://images.unsplash.com/photo-1517433456452-f9633a875f6f?auto=format&fit=crop&w=120&q=80', '2025-05-02', 'USER01', 98, 'CAT07', 1),

('news03', N'Hướng dẫn sử dụng ChatGPT trong công việc', 
 N'ChatGPT là công cụ hỗ trợ đắc lực cho nhiều ngành nghề, giúp viết nội dung, trả lời email, tạo báo cáo nhanh chóng và hiệu quả. Hướng dẫn sử dụng bao gồm các bước cơ bản như đặt câu hỏi rõ ràng và kiểm tra lại kết quả.', 
 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=120&q=80', '2025-05-03', 'USER01', 150, 'CAT06', 1),

('news04', N'Thực đơn Eat Clean cho người tăng cân', 
 N'Thực đơn Eat Clean tập trung vào thực phẩm nguyên chất, giàu dinh dưỡng và không qua chế biến. Người tăng cân nên chú ý bổ sung protein, carbohydrate và chất béo lành mạnh để hỗ trợ phát triển cơ bắp và tăng trọng lượng hiệu quả.', 
 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=120&q=80', '2025-05-04', 'USER01', 210, 'CAT03', 0),

('news05', N'Khám phá 5 cuốn sách thay đổi tư duy', 
 N'Những cuốn sách nổi bật như "Tư duy nhanh và chậm", "Đắc nhân tâm", "Người giàu có nhất thành Babylon" giúp thay đổi cách nhìn nhận và tư duy trong cuộc sống. Hãy đọc để mở rộng kiến thức và cải thiện bản thân mỗi ngày.', 
 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&w=120&q=80', '2025-05-05', 'USER01', 75, 'CAT04', 1),

('news06', N'Cách xây dựng ứng dụng Java Swing', 
 N'Java Swing cho phép tạo giao diện đồ họa cho ứng dụng desktop với nhiều thành phần linh hoạt. Hướng dẫn này bao gồm thiết lập môi trường, tạo cửa sổ, xử lý sự kiện và bố trí thành phần để xây dựng ứng dụng hoàn chỉnh.', 
 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=120&q=80', '2025-05-06', 'USER01', 130, 'CAT06', 1),

('news07', N'Top 3 framework web phổ biến 2025', 
 N'React, Angular và Vue là ba framework được dùng nhiều nhất hiện nay. Mỗi framework có ưu điểm riêng phù hợp với nhiều dự án khác nhau từ quy mô nhỏ đến lớn, hỗ trợ phát triển front-end mạnh mẽ và linh hoạt.', 
 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=120&q=80', '2025-05-07', 'USER01', 180, 'CAT02', 1),

('news08', N'Học SQL cơ bản trong 1 tuần', 
 N'SQL là ngôn ngữ truy vấn dữ liệu phổ biến trong ngành công nghệ thông tin. Khóa học này giúp bạn hiểu cú pháp cơ bản, các phép toán truy vấn, cũng như cách quản lý cơ sở dữ liệu hiệu quả chỉ trong một tuần.', 
 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=120&q=80', '2025-05-08', 'USER01', 90, 'CAT06', 0),

('news09', N'Cập nhật công nghệ mới 2025', 
 N'Xu hướng công nghệ mới năm 2025 bao gồm AI, IoT, Blockchain và điện toán đám mây phát triển mạnh mẽ. Các doanh nghiệp đang tích cực áp dụng để nâng cao hiệu quả vận hành và tạo lợi thế cạnh tranh.', 
 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=120&q=80', '2025-05-09', 'USER01', 210, 'CAT06', 1),

('news10', N'Cách viết CV thu hút nhà tuyển dụng', 
 N'Một CV ấn tượng cần trình bày rõ ràng kinh nghiệm, kỹ năng và thành tích nổi bật. Tập trung vào các điểm mạnh, tránh lỗi chính tả và định dạng đẹp mắt sẽ giúp bạn ghi điểm với nhà tuyển dụng.', 
 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=120&q=80', '2025-05-10', 'USER01', 65, 'CAT07', 0);

-- Dữ liệu mẫu: NEWSLETTERS
INSERT INTO NEWSLETTERS (Email, Enabled) VALUES
('reader1@gmail.com', 1),
('reader3@gmail.com', 0),
('reader5@gmail.com', 1),
('reader7@gmail.com', 1)
