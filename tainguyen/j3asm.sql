-- Tạo cơ sở dữ liệu
CREATE DATABASE j3asm;
GO
USE j3asm;
GO

-- Tạo bảng CATEGORIES
CREATE TABLE CATEGORIES (
    Id NVARCHAR(50) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);

-- Tạo bảng USERS
CREATE TABLE USERS (
    Id NVARCHAR(50) PRIMARY KEY,
    Password NVARCHAR(100) NOT NULL,
    Fullname NVARCHAR(100) NOT NULL,
    Birthday DATE,
    Gender BIT,
    Mobile NVARCHAR(20),
    Email NVARCHAR(100),
    Role BIT
);

-- Tạo bảng NEWS
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
);

-- Tạo bảng NEWSLETTERS
CREATE TABLE NEWSLETTERS (
    Email NVARCHAR(100) PRIMARY KEY,
    Enabled BIT
);

-- Dữ liệu mẫu: CATEGORIES (chỉ 3 chủ đề)
INSERT INTO CATEGORIES (Id, Name) VALUES
('CAT01', N'Pháp luật'),
('CAT02', N'Thể thao'),
('CAT03', N'Văn hóa');

-- Dữ liệu mẫu: USERS
INSERT INTO USERS (Id, Password, Fullname, Birthday, Gender, Mobile, Email, Role) VALUES
('hung', N'123', N'La Ngoc Hung', '1990-01-01', 1, '0912345678', 'nva@gmail.com', 1),
('hai', N'123', N'Hai', '1988-03-03', 1, '0934567890', 'lvc@gmail.com', 0),
('kha', N'123', N'Kha', '1993-05-05', 1, '0956789012', 'hve@gmail.com', 0)


INSERT INTO NEWS (Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home) VALUES 
('news01', N'VinUni đặt mục tiêu vào top 100 đại học hàng đầu thế giới', 
 N'VinUni được đầu tư 9.300 tỷ đồng, dự kiến tuyển 500 nhân sự học thuật toàn cầu, hướng tới mục tiêu vào top 100 đại học hàng đầu thế giới.

Mục tiêu này nằm trong chiến lược phát triển giai đoạn hai, với trọng tâm là chương trình "VinUni 500" - tuyển chọn 500 nhân sự học thuật tinh hoa toàn cầu. Nguồn lực tài chính do Tập đoàn Vingroup tài trợ, nhằm mở rộng quy mô đào tạo và xây dựng hệ sinh thái nghiên cứu đạt chuẩn quốc tế tại Việt Nam.
Chiến lược giai đoạn hai tập trung vào hai trụ cột: phát triển hạ tầng học thuật - nghiên cứu và nâng cao đội ngũ nhân lực theo chuẩn quốc tế. Trường định hướng nghiên cứu 5 lĩnh vực gồm: trí tuệ nhân tạo và robotics, y học và công nghệ sức khỏe, đô thị thông minh và môi trường, dữ liệu lớn và tính toán hiệu năng cao, chính sách và phát triển bền vững. Về hạ tầng, Vingroup cam kết đầu tư 9.300 tỷ đồng cho VinUni. Trong đó, 1.500 tỷ đồng dành để mở rộng khuôn viên, xây giảng đường, ký túc xá, khu thể thao và phòng thí nghiệm hiện đại. Quy mô đào tạo tăng từ 1.500 lên 5.000 sinh viên, với khoảng 50% là học viên sau đại học- lực lượng nòng cốt cho hoạt động nghiên cứu.

VinUni sẽ xây dựng Tổ hợp nghiên cứu và đổi mới sáng tạo Công nghiệp- trung tâm tích hợp các phòng thí nghiệm công nghệ cao, không gian hợp tác đại học - doanh nghiệp và hội trường quốc tế 1.000 chỗ. Dự kiến, hơn 600 nhà khoa học sẽ làm việc thường xuyên tại đây.

Tổ hợp này là nơi các chuyên gia từ hệ sinh thái doanh nghiệp của Vingroup như VinFast, Vinmec, VinBigData, VinRobotics, VinMotion... cùng giảng viên và sinh viên phát triển các nhóm đồng sáng tạo, tập trung vào nghiên cứu ứng dụng, thương mại hóa nhanh và thúc đẩy tinh thần khởi nghiệp.

Cùng với tổ hợp tại chỗ, VinUni sẽ hợp tác với các đại học danh tiếng toàn cầu như Cornell, Pennsylvania, Đại học Công nghệ Nanyang (Singapore)... và các đại học uy tín tại Việt Nam nhằm phát triển các cụm nghiên cứu liên ngành (RISE research clusters), hướng đến công bố học thuật chất lượng cao và giải quyết những thách thức lớn của quốc gia.

Bên cạnh đó, trường cũng sẽ hợp tác với các đại học danh tiếng như Cornell, Pennsylvania, Đại học Công nghệ Nanyang (Singapore) và một số đại học lớn tại Việt Nam để phát triển các cụm nghiên cứu liên ngành (RISE research clusters), hướng đến công bố khoa học chất lượng cao và giải quyết các vấn đề lớn của quốc gia.Về nhân lực học thuật, trường triển khai chương trình "VinUni 500" nhằm tuyển chọn 500 nhà khoa học và giảng viên tinh hoa toàn cầu, ưu tiên học giả Việt Nam ở nước ngoài. Danh mục mời tuyển gồm: 10 giám đốc Khoa học quốc tế, 200 giảng viên - nhà nghiên cứu có công bố quốc tế, 200 học giả sau tiến sĩ và 100 giảng viên liên kết.

Trường áp dụng chính sách đãi ngộ tương đương các đại học hàng đầu thế giới, với quỹ phát triển sự nghiệp cá nhân lên tới 150 triệu đồng mỗi năm và quỹ khởi động nghiên cứu lên tới 6 tỷ đồng mỗi người.

Chương trình không chỉ nhằm nâng cao chất lượng đào tạo, nghiên cứu, mà còn kết nối mạng lưới học giả Việt Nam trong và ngoài nước, cũng như các học giả từng nhận giải thưởng VinFuture - nơi quy tụ nhiều nhà khoa học hàng đầu - để thúc đẩy hợp tác nghiên cứu thực chất và có giá trị ứng dụng cao.

Tiến sĩ Lê Mai Lan, Chủ tịch Hội đồng Trường VinUni, cho biết: "Không chỉ là trường đại học, VinUni còn hướng đến việc đào tạo thế hệ nhân lực tương lai. Chúng tôi kỳ vọng việc thu hút nhân tài, kết hợp với hệ sinh thái doanh nghiệp, sẽ đóng góp tích cực cho chiến lược phát triển quốc gia".

Sau 5 năm thành lập, VinUni được Tổ chức xếp hạng giáo dục Quacqurelli Symonds của Anh trao chứng nhận 5 QS sao toàn diện- trở thành một trong những trường đại học đạt danh hiệu QS nhanh nhất.', 
 '1.png', 
 '2025-06-09', 'hung', 120, 'CAT01', 0),

('news04', N'Phạt nặng để doanh nghiệp không dám trục lợi từ dữ liệu cá nhân', 
 N'Thứ trưởng Công an cho biết nếu quy định xử phạt quá nhẹ, nhiều doanh nghiệp với mức lợi nhuận hàng nghìn tỷ sẵn sàng nộp phạt để kinh doanh dữ liệu cá nhân.

Tại phiên họp Ủy ban Thường vụ Quốc hội sáng 5/6, ông Hùng nhấn mạnh, nhiều hành vi vi phạm trong lĩnh vực dữ liệu cá nhân gây hậu quả nghiêm trọng, đặc biệt khi xảy ra ở các doanh nghiệp công nghệ, tập đoàn đa quốc gia. "Nếu mức phạt quá nhẹ, họ sẵn sàng nộp phạt để đổi lấy lợi nhuận hàng nghìn tỷ đồng", ông nói.

Dẫn kinh nghiệm quốc tế, ông Hùng cho biết nhiều nước như Mỹ, EU, Singapore áp dụng mức phạt theo phần trăm doanh thu, có thể lên tới 600 tỷ đồng (quy đổi). Dự thảo luật đề xuất mức phạt hành chính tối đa là 3 tỷ đồng, có thể tăng đến 10 lần khoản thu bất hợp pháp. Với hành vi chuyển dữ liệu cá nhân ra nước ngoài, mức phạt có thể lên đến 5% doanh thu năm trước đó. Cá nhân vi phạm có thể bị phạt tối đa bằng một nửa mức của tổ chức.

Ngoài phạt tiền, Thứ trưởng Hùng cho biết dự luật giao Chính phủ quy định chi tiết các hình thức xử phạt không bằng tiền, cũng như phương pháp tính khoản thu trái pháp luật.

"Dữ liệu cá nhân gắn với quyền con người, quyền riêng tư, nên không thể coi là hàng hóa thông thường. Việc khai thác phải đi đôi với bảo vệ ở mức cao nhất", ông nói, đồng thời khẳng định Chính phủ đề nghị giữ quy định cấm mua bán dữ liệu cá nhân để phù hợp thông lệ quốc tế.
Đại diện cơ quan thẩm tra, Chủ nhiệm Ủy ban Quốc phòng, An ninh và Đối ngoại Lê Tấn Tới cho biết tùy theo tính chất, mức độ, hậu quả, dự luật quy định người vi phạm bị xử phạt hành chính hoặc truy cứu trách nhiệm hình sự; nếu gây thiệt hại thì phải bồi thường.

Do tính chất và hậu quả nghiêm trọng của hành vi, ông Tới đồng tình cần quy định mức phạt cao hơn để bảo đảm tính răn đe đối với các doanh nghiệp lớn, đặc biệt là các tập đoàn đa quốc gia hoặc doanh nghiệp công nghệ có doanh thu hàng nghìn tỷ đồng.

Tuy nhiên, Phó chủ nhiệm Ủy ban Pháp luật và Tư pháp Nguyễn Trường Giang cho rằng cần cân nhắc mức phạt 5% doanh thu của doanh nghiệp năm liền trước. Ông dẫn ví dụ: Viettel đạt gần 190.000 tỷ đồng doanh thu, VNPT hơn 58.000 tỷ và MobiFone khoảng 23.500 tỷ. "Phạt 5% là con số rất lớn", ông nhận xét.

Dự kiến, Quốc hội sẽ thông qua dự án Luật Dữ liệu cá nhân vào ngày 23/6.Trong phiên sơ thẩm kéo dài 4 ngày hồi tháng 3 tại TAND Hà Nội, ông Nghiêm Quang Minh, 45 tuổi, chủ chung cư mini ở phố Khương Hạ, bị tuyên mức án cao nhất trong 8 người về tội Vi phạm quy định về phòng cháy, chữa cháy, theo Điều 313 Bộ luật Hình sự.

Trong 7 cựu cán bộ thuộc quận Thanh Xuân và phường Khương Đình bị kết tội Thiếu trách nhiệm gây hậu quả nghiêm trọng, ông Chu Xuân Sơn (nguyên phó chủ tịch UBND phường, giai đoạn 2015-2020) án 6 năm; Nguyễn Đình Quân (nguyên tổ trưởng Thanh tra Xây dựng phường, giai đoạn 2014-2016) án 7 năm.

Ông Phạm Tần Anh (nguyên phó chủ tịch UBND phường từ năm 2018) và Nguyễn Tuấn Anh (nguyên phó Công an phường Khương Đình) mỗi người 4 năm tù.

Ông Trần Trọng Khang (cựu đội trưởng Thanh tra Xây dựng quận Thanh Xuân, giai đoạn 2013-2016) 3 năm tù; Nguyễn Thị Kim Trang (nguyên cán bộ địa chính - xây dựng phường, giai đoạn 2010-2018) và Phạm Thanh Tùng (cựu nhân viên hợp đồng phụ trách lĩnh vực môi trường đô thị) mỗi người 30 tháng tù.

Về dân sự, tòa đánh giá thiệt hại xảy ra do vi phạm quy định xây dựng và phòng cháy chữa cháy của bị cáo Minh, do đó toàn bộ thiệt hại về tài sản và bồi thường cho bị hại thuộc trách nhiệm bị cáo này, tổng hơn 23,7 tỷ đồng.

Cụ thể, với 56 người tử vong, Minh có nghĩa vụ bồi thường chi phí mai táng theo giá dịch vụ hiện hành, và tổn thất tinh thần cho những người thuộc hàng thừa kế thứ nhất của người tử nạn với mức 100 tháng lương. Ngoài ra, nếu nạn nhân có con nhỏ hoặc cha mẹ già, bị cáo Minh còn có nghĩa vụ cấp dưỡng cho họ đến khi mất, cho con nạn nhân đến khi đủ 18 tuổi với mức một tháng lương cơ sở (2.340.000 đồng) một người một tháng.

Với những người bị thương, HĐXX tuyên Minh phải bồi thường tổn thất tinh thần mức tối đa 50 tháng lương cơ sở cho người nằm viện trên 30 ngày; 20 tháng lương cơ sở cho người nằm viện 20-30 ngày và người nằm viện dưới 10 ngày là 10 tháng lương cơ sở.

Mỗi người cũng được chấp nhận mức bồi thường chi phí phục hồi là một tháng lương cơ sở. Riêng 3 bị hại bị thương tích nặng nhất, tòa yêu cầu bị cáo Minh bồi thường 18 tháng lương cơ sở cho chi phí phục hồi (tức từ khi xảy ra vụ án đến phiên sơ thẩm).
Bản án sơ thẩm xác định ông Minh sở hữu thửa đất 240 m2 ở phố Khương Hạ, được cấp phép xây dựng nhà ở riêng lẻ. Diện tích xây dựng tầng một 167,4 m2 nhưng gia chủ đã tự ý thay đổi thiết kế, xây sàn tầng một tới 240 m2. Giấy phép cho xây 6 tầng, 33 phòng song đã xây 9 tầng, 45 phòng - vượt 3 tầng và 12 phòng.

Ông Minh không lập hồ sơ thiết kế, thẩm duyệt, nghiệm thu, quản lý về phòng cháy chữa cháy.

Tháng 4/2016, bị cáo Minh bán xong 45 căn hộ cho các cá nhân và hộ gia đình.

Ngày 24/6/2020, quận Thanh Xuân ra quyết định đình chỉ hoạt động tầng một của tòa nhà. Minh và các hộ dân sinh sống tại đây, theo đó, phải thực hiện các yêu cầu về đảm bảo an toàn PCCC nhưng không thực hiện. Công an quận Thanh Xuân tiếp tục gửi công văn cho họ và cả Công an phường Khương Đình nhưng không có chuyển biến.

Đêm 12/9/2023, mạch điện trên đường dây dẫn tại khu vực bình ắc quy đặt ở giáp tường bị chập, gây cháy. Lửa lan vào khu vực cáp điện, các hộp công tơ điện gắn trên tường tầng một rồi cháy lan ra xung quanh. Hỏa hoạn đã làm 56 người tử vong, 44 người bị thương, thiệt hại 3,2 tỷ đồng về tài sản.', 
 '2.png', 
 '2025-06-05', 'hung', 210, 'CAT01', 1),

('news10', N'Hồ sơ công chứng đất đai phải được lưu trữ ít nhất 30 năm', 
 N'Từ 1/7, tổ chức hành nghề công chứng phải lưu trữ hồ sơ giao dịch bất động sản trong ít nhất 30 năm và ít nhất 10 năm với các loại giao dịch khác.

Đây là một trong nhiều điểm mới được điều chỉnh trong Luật Công chứng 2024, có hiệu lực từ ngày 1/7, sau 10 năm thi hành Luật Công chứng 2014.

Về hoạt động lưu trữ hồ sơ công chứng, luật năm 2014 không phân định thời hạn lưu trữ hồ sơ tối thiểu cho từng loại giao dịch, chỉ nêu yêu cầu chung. Theo đó, bản chính văn bản công chứng và các giấy tờ khác trong hồ sơ công chứng phải được lưu trữ ít nhất 20 năm tại trụ sở của tổ chức hành nghề công chứng.

Tại điều 68, luật mới phân loại giao dịch theo mức độ quan trọng để quy định thời gian lưu trữ tối thiểu tương ứng. Cụ thể, với các giao dịch có đối tượng là bất động sản, luật yêu cầu tổ chức hành nghề công chứng phải lưu trữ hồ sơ tại trụ sở trong ít nhất 30 năm. Các giao dịch khác thời gian tối thiểu 10 năm.

Việc lưu trữ ngoài trụ sở phải được sự đồng ý của Sở Tư pháp nơi tổ chức công chứng đặt trụ sở. Không chỉ quy định thời hạn, luật mới cũng siết quy định bảo quản hồ sơ công chứng trong quá trình lưu trữ này. Theo đó, tổ chức hành nghề công chứng có trách nhiệm bảo quản hồ sơ chặt chẽ, thực hiện đủ các biện pháp an ninh, an toàn về phòng, chống cháy, nổ, ẩm mốc, mối mọt.

Trường hợp bị giải thể hoặc chấm dứt hoạt động, tổ chức hành nghề công chứng đó phải thỏa thuận để tổ chức hành nghề công chứng khác trong cùng tỉnh lưu trữ các hồ sơ này.

Việc cấp bản sao của văn bản công chứng cũng được quy định chặt chẽ hơn. Theo điều 69 của luật năm 2024 việc cấp bản sao văn bản công chứng được thực hiện khi cơ quan nhà nước có thẩm quyền yêu cầu hoặc theo yêu cầu của các bên tham gia giao dịch, người có quyền, nghĩa vụ liên quan đến giao dịch đã được công chứng.

Riêng việc cấp bản sao theo yêu cầu của người có quyền, nghĩa vụ liên quan, luật mới yêu cầu chỉ được thực hiện khi người yêu cầu công chứng đồng ý.

Trường hợp người yêu cầu công chứng đã chết hoặc pháp nhân chấm dứt hoạt động thì phải được sự đồng ý của người thừa kế hoặc người cá nhân, tổ chức kế thừa quyền, nghĩa vụ của pháp nhân đó. Đây là những yêu cầu mà luật cũ không quy định.

Mọi hồ sơ công chứng giấy phải được dữ liệu hóa

Cũng theo luật mới, từ 1/7 công dân có nhu cầu có thể thực hiện việc công chứng điện tử, trực tuyến.', 
 '3.png', 
 '2025-06-10', 'hung', 65, 'CAT01', 0),

('news07', N'Hậu vệ Bồ Đào Nha tự hào "bắt chết" Yamal', 
 N'Hậu vệ trái Nuno Mendes phấn khích khi vô hiệu hóa Lamine Yamal trong trận Bồ Đào Nha thắng Tây Ban Nha ở chung kết Nations League."Đây là một cuộc đối đầu như bao cuộc đối đầu khác mà tôi đã trải qua trong mùa giải", Mendes nói sau trận đấu trên sân Allianz, Munich tối 8/6. "Tôi đã đối mặt nhiều cầu thủ tuyệt vời, rất kỹ thuật và có thể tạo ra sự khác biệt. Hôm nay, tôi khóa chặt Lamine và không cho cậu ấy làm điều cậu ấy giỏi nhất".

Mendes đánh giá Yamal có mùa giải tuyệt vời, nhưng tin đồng đội ở PSG Ousmane Dembele sẽ giành Quả Bóng Vàng. "Dembele dính nhiều chấn thương ở Barca trước khi đến PSG, nhưng là cầu thủ đáng kinh ngạc", hậu vệ Bồ Đào Nha bày tỏ. "Tôi rất quý mến cậu ấy cả về tư cách lẫn tài năng. Tôi cùng các đồng đội sẽ giúp Dembele giành Quả Bóng Vàng".Tại Allianz tối qua, Yamal không để lại nhiều dấu ấn khi đối mặt Mendes. Tiền vệ cánh phải của Tây Ban Nha chạm bóng 81 lần, chuyền chính xác 88% với một đường chuyền mở ra cơ hội, dứt điểm 4 lần với 2 cú trúng đích và chỉ có một lần qua người. Anh nhường chỗ cho Yeremi Pino ở hiệp phụ thứ hai.

Phía đối diện, Mendes có ngày thi đấu chói sáng. Anh phá bóng ba lần, chặn cú sút một lần, tắc bóng ba lần, đánh chặn hai lần và không để qua người lần nào.

Không chỉ hoàn thành tốt nhiệm vụ phòng ngự, Mendes còn góp công vào cả hai bàn của Bồ Đào Nha. Phút 26, hậu vệ thuộc biên chế PSG xộc vào vòng cấm rồi sút chìm chéo góc quân bình tỷ số 1-1. Đầu hiệp hai, anh vượt qua chính Yamal bên cánh trái rồi tạt vào vòng cấm cho Cristiano Ronaldo dứt điểm thành bàn, đưa trận đấu vào loạt luân lưu.

Tại đây, thủ thành Diogo Costa cản cú sút của tiền đạo vào sân thay người Alvaro Morata, giúp Bồ Đào Nha thắng 5-3. Nhờ đó, Bồ Đào Nha trở thành đội đầu tiên vô địch Nations League hai lần, sau kỳ đầu tiên năm 2019.Ở cấp CLB, Mendes cũng có mùa giải thành công khi cùng PSG thâu tóm cả bốn danh hiệu là Ligue 1, Siêu Cup Pháp, Cup Quốc gia và Champions League.

"Tất cả là nhờ sự nỗ lực không ngừng", hậu vệ 22 tuổi nói về sự tiến bộ của bản thân. "Tôi đã chơi nhiều trận tốt và đó là kết quả của quá trình làm việc chăm chỉ cùng các HLV ở PSG và Bồ Đào Nha. Tôi rất vui vì giúp đội vô địch Nations League".

Mendes cũng dành những lời tri ân cho Ronaldo - tiền đạo 40 tuổi khóc nức nở khi đoạt danh hiệu thứ ba cùng Bồ Đào Nha (hai Nations League, một Euro).

"Chúng tôi rất vui khi Ronaldo đoạt thêm danh hiệu", hậu vệ 22 tuổi cho biết. "Ronaldo giúp chúng tôi trên sân và cả ngoài sân cỏ với rất nhiều lời khuyên cho tất cả cầu thủ, kể cả tôi. Bồ Đào Nha cần Ronaldo trong đội. Anh ấy có thái độ, tinh thần chiến thắng tuyệt vời và là hình mẫu cho toàn đội".', 
 '4.png', 
 '2025-06-07', 'hung', 180, 'CAT02', 1),

('news05', N'Indonesia đề nghị FIFA minh bạch ở vòng loại World Cup 2026', 
 N'Indonesia rồi Iraq cùng đề nghị LĐBĐ thế giới (FIFA) và LĐBĐ châu Á (AFC) minh bạch tiêu chí chọn chủ nhà đăng cai vòng loại bốn World Cup 2026 – khu vực châu Á.

Vòng loại bốn gồm 6 đội tuyển, thuộc nhóm đứng thứ ba và thứ tư ở các bảng đấu tại vòng loại ba khu vực châu Á. Các đội này sẽ được bốc thăm chia làm hai bảng thi đấu tập trung tại hai quốc gia. FIFA và AFC chưa công bố hai nước chủ nhà, nhưng có tin đồn Arab Saudi và Qatar sẽ được chọn.

Sau lượt chín vòng loại ba hôm 5/6, Qatar cùng UAE, Indonesia và Iraq vào vòng loại bốn. Hai vé còn lại phải chờ đến hết lượt cuối ngày 10/6 để phân định giữa Oman, Palestine (bảng B) và Arab Saudi, Australia (bảng C). Khả năng Arab Saudi chiếm vị trí nhì bảng của Australia không cao, do phải thắng cách biệt năm bàn.Trong thời gian qua, các sự kiện bóng đá lớn của châu Á và thế giới hầu hết được tổ chức tại Tây Á. Qatar đã đăng cai World Cup 2022, Asian Cup 2023, U23 châu Á 2024. Arab Saudi sẽ tổ chức World Cup 2034, U23 châu Á 2026 và Asian Cup 2027. Trong khi đó, Asian Cup 2019 diễn ra ở UAE.

Các nước Tây Á được đánh giá cao về tiềm lực tài chính, cơ sở hạ tầng thể thao và tổ chức giải chuyên nghiệp. Tuy nhiên, điều này cũng kéo theo một số lo ngại thiên vị dành cho AFC hay FIFA.

Vì vậy, LĐBĐ Indonesia (PSSI) đã gửi công văn đề nghị FIFA và AFC minh bạch các tiêu chí chọn chủ nhà vòng loại bốn. Bên cạnh đó, họ cũng nộp đơn xin đăng cai. Chủ tịch Erick Thohir khẳng định không ngại thi đấu ở bất kỳ quốc gia nào nhưng cần sự minh bạch.

Hôm qua, LĐBĐ Iraq (IFA) cũng gửi đơn lên FIFA và AFC, để xin đăng cai vòng loại bốn. IFA khẳng định có đủ cơ sở hạ tầng, kinh nghiệm tổ chức và đảm bảo an ninh cho sự kiện thể thao quốc tế.

"Chúng tôi đánh giá cao đề xuất của Indonesia về việc làm rõ các tiêu chí chọn chủ nhà", công văn của IFA có đoạn. "Việc công bố các tiêu chí và thời gian phê duyệt góp phần củng cố niềm tin giữa các liên đoàn thành viên, đảm bảo nguyên tắc bình đẳng về cơ hội".Vòng loại bốn World Cup 2026 – khu vực châu Á diễn ra vào tháng 10, với ba lượt trận lần lượt vào ngày 8/10, 11/10 và 14/10. Lễ bốc thăm diễn ra ngày 17/7 nhưng chưa có tiêu chí cụ thể.

Hai đội dẫn đầu mỗi bảng sẽ giành vé trực tiếp dự World Cup 2026. Hai đội nhì sẽ đá play-off theo thể thức sân nhà sân khách vào tháng 11. Đội thắng sẽ tiếp tục vòng play-off liên lục địa với hai đội tuyển Bắc Trung Mỹ, một Nam Mỹ, châu Phi và châu Đại dương.', 
 '5.png', 
 '2025-05-05', 'hung', 75, 'CAT02', 1),

('news02', N'Spalletti từ chức HLV Italy', 
 N'ItalyHai ngày sau trận thua Na Uy 0-3 ở vòng loại World Cup 2026, Luciano Spalletti thông báo sẽ rời vị trí HLV trưởng tuyển Italy.

Spalletti sẽ nắm quyền nốt trận gặp Moldova ở lượt bốn bảng I vòng loại World Cup 2026 - khu vực châu Âu trên sân Mapei, Reggio Emilia, Italy lúc 1h45 ngày 10/6, giờ Hà Nội. Sau đó, ông sẽ thôi việc tại đội tuyển. "Tôi rất tiếc, vì xét tới mối quan hệ giữa chúng tôi, tôi không có ý định từ bỏ", Spalletti nói tại họp báo ngày 8/6. "Tôi thích ở lại và làm công việc này, đặc biệt là khi mọi thứ không diễn ra tốt đẹp. Nhưng khi bị thôi việc, tôi phải chấp nhận. Tôi luôn coi vai trò này là phục vụ tổ quốc và muốn giúp đỡ tương lai của đội tuyển. Các cầu thủ Italy rất tốt, nên tôi phải chịu trách nhiệm về kết quả".

Từ khi thay thế Roberto Mancini hồi tháng 8/2023, Spalletti dẫn dắt tuyển Italy 23 trận, trong đó có 6 thua, 6 hòa và 11 thắng. Ông chịu nhiều chỉ trích từ Euro 2024, nơi Italy sớm trở thành cựu vương khi thua Thụy Sĩ 0-2 ở vòng 1/8. Thảm bại 0-3 trên sân Na Uy hôm 6/6 là "giọt nước tràn ly".

Spalletti cho biết điều tiếc nuối nhất trong 2 năm qua là không giúp Italy đạt được chất lượng chơi bóng như mong muốn. "Tôi biết sẽ có những thời điểm khó khăn khi tôi nhận việc. Và tôi đã không thành công", ông thừa nhận. "Truyền thông đã tử tế khi bình luận về điều đó. Có lẽ tôi đáng bị chỉ trích nặng nề hơn".

Sau đó, Spalletti từ chối trả lời hàng loạt câu hỏi từ các phóng viên rồi đứng dậy bỏ đi sau khi được hỏi liệu ông có cảm thấy "bị phản bội" hay không.

Spalletti từng dẫn dắt nhiều CLB Italy như Empoli, Sampdoria, Udinese, AS Roma hay Inter Milan. Đỉnh cao của ông là cùng Napoli vô địch Serie A 2022-2023. Tuy nhiên, do mâu thuẫn với ban lãnh đạo, ông rời CLB ngay sau chiến tích đó.', 
 '6.png', 
 '2025-06-08', 'hung', 98, 'CAT02', 1),

('news03', N'Quốc sách cho quốc bảo', 
 N'Chiếc ngai vàng biểu tượng quyền lực tối cao của 13 đời vua Nguyễn - độc bản linh thiêng còn lại sau 143 năm - bị bẻ gẫy tay còn đầu rồng ném xuống sàn đá. Những hình ảnh khó tin khiến tôi bàng hoàng.

Mắt tôi tối sầm. Ký ức tua nhanh: từ cậu sinh viên kiến trúc lần đầu chiêm ngưỡng ngai vàng - đến giảng viên dẫn sinh viên kiến tập hàng năm - rồi làm luận văn tiến sĩ đề tài bảo tồn di sản, nâng niu từng viên ngói, cấu kiện, hoa văn. Tình yêu di sản trong tôi được bồi đắp theo năm tháng.

Trong hành trình nghiên cứu và giảng dạy quy hoạch - kiến trúc, tôi từng thăm nhiều quốc gia, khảo sát nhiều không gian biểu tượng quốc thể với nhiều bảo vật: từ Tử Cấm Thành Bắc Kinh tới hoàng cung Tokyo và cung điện Gyeongbokgung; từ cung Versailles, bảo tàng Louvre tới cung Buckingham, bảo tàng Anh; từ tòa thánh Vatican tới giáo đường Hagia Sophia; từ đền Parthenon đến nhà tưởng niệm Lincoln. Ngai Takamikura ở Kyoto hay ngai vua - nữ hoàng ở London chỉ xuất hiện dịp lễ đăng quang và trưng bày vài ngày (xem ảnh). Ngai Thánh Peter (tức Phê-rô) ở Vatican nằm trong hậu cung, chỉ hiện diện trong vài nghi lễ đặc biệt.

Các bảo vật quyền lực tối cao đều được trưng bày trong không gian và lớp an ninh vững chắc, giữ khoảng cách vật lý - tâm lý với người xem, không dễ tiếp cận như ở điện Thái Hòa.

Về không gian tổng thể, ngai vàng triều Nguyễn tọa lạc tại vị trí "năm tầng bậc trung tâm" của không gian di sản thế giới: Quần thể di sản - Đại Nội - điện Thái Hòa - gian giữa - ngai vàng. Tầng sau nối tầng trước, hội tụ dần về trung tâm của mọi trung tâm.

Với cấu trúc ấy, ngai vàng không chỉ kết tinh quyền lực triều Nguyễn mà còn là biểu tượng cao nhất của cả quần thể di sản thế giới; không chỉ là bảo vật quốc gia mà còn mang tầm báu vật Á Đông và xa hơn, cần được bảo vệ bằng tâm thế tương xứng.

Giả sử ngai vàng được tu sửa thành công, thì điều dư luận quan tâm là sau đó nên trưng bày sao cho an toàn? Tôi xin đề xuất vài phương án:

Phương án 1 - "Tàng bảo vật - hiển bản sao": Trưng bày bản sao, ngai thật lưu kho, chỉ rước ra dịp trọng đại. Ưu điểm là bảo vệ tuyệt đối, tăng tính thiêng, phù hợp ngân sách hạn chế. Nhược điểm là giảm cảm xúc do không thấy hiện vật gốc, và các bảo vật khác có rủi ro nếu nội điện vẫn mở.

Phương án 1b - "Bảo mật cao - thăm giới hạn": Trưng bày ngai thật bằng công nghệ cao trong một không gian kín ở hậu điện, bán vé bổ sung để vào xem. Ưu điểm là phục vụ nhóm khách quan tâm cao, tạo nguồn thu duy trì công nghệ bảo vệ. Tôi từng thấy cách thu phụ phí này ở vài nơi.

Phương án 2 - "Hiển bản thật - Kính bảo an": Giữ ngai thật tại chỗ, đặt trong hộp kính chịu lực. Ưu điểm là giữ nguyên cảm nhận không gian, kính bảo vệ tốt. Còn nhược điểm là có thể ảnh hưởng thẩm mỹ và hiệu ứng thị giác tổng thể.

Phương án 3 - "Hiển bản thật - Chiêm bái vọng": Giữ ngai thật nhưng không cho vào nội điện, chỉ ngắm từ xa qua ba ô cửa lớn, có hàng rào bảo vệ. Ưu điểm là ngăn tiếp cận bất ngờ, bảo vệ bảo vật khác; giữ được sự trang nghiêm. Nhưng nhược điểm là trải nghiệm bị hạn chế do khoảng cách.

Đồng thời, cần đẩy mạnh số hóa di sản: dùng AR tại chỗ để tái hiện các bảo vật trong không gian thực; kết hợp VR hoặc hologram để mang báu vật tới mọi miền đất nước và quốc tế - như gian Việt Nam tại Expo thế giới. Tổ chức trưng bày bản sao hay phiên bản số luân phiên tại các bảo tàng lớn - để cả người già, trẻ nhỏ hay bệnh nhân không thể đến Huế vẫn được chiêm ngưỡng.

Nhưng trưng bày là vế sau lâu dài. Việc trước mắt là phục chế ngai vàng.

', 
 '7.png', 
 '2025-05-03', 'hung', 150, 'CAT03', 1),

('news06', N'Lịch công bố điểm thi, điểm chuẩn lớp 10 của 63 tỉnh, thành', 
 N'Gần 50 địa phương dự kiến công bố điểm thi, điểm chuẩn lớp 10 vào giữa tháng 6, riêng Bình Phước đến 15/8.

Trong đó, Bạc Liêu công bố đầu tiên, hôm 3/6. Tỉnh này tổ chức thi lớp 10 sớm nhất cả nước, vào ngày 22-23/5. Tiếp đó là Lai Châu (8/6).

Còn lại, phần lớn dự kiến lịch báo điểm thi, điểm chuẩn lớp 10 trong khoảng 12-20/6. Một số tỉnh thông báo vào tháng 7 là Hà Nội, Bắc Giang, Bến Tre, Ninh Thuận, Vĩnh Long, Trà Vinh, Tuyên Quang...

Nhiều nơi công bố hai đầu điểm cùng ngày như Bình Dương, Đồng Nai, Quảng Ninh, Huế.. Số khác công bố điểm chuẩn vài ngày sau khi có kết quả thi.Theo quy chế tuyển sinh THCS và THPT của Bộ Giáo dục và Đào tạo, từ năm nay, các địa phương có thể chọn thi tuyển, xét tuyển hoặc kết hợp để tuyển sinh lớp 10. Nếu thi tuyển, kỳ thi gồm Toán, Văn và môn thứ ba (hoặc bài thi tổ hợp). Môn này được lựa chọn từ các môn được đánh giá bằng điểm số, nhưng không được chọn một môn quá ba năm liên tiếp.

Trong năm đầu thí sinh thi theo chương trình mới, các địa phương đều chọn môn thứ ba là Tiếng Anh, trừ Hà Giang chọn môn tích hợp là Lịch sử và Địa lý.

59/63 tỉnh, thành tổ chức thi tuyển. Nhóm xét tuyển là Cà Mau, Gia Lai, Vĩnh Long và Lâm Đồng, áp dụng với hệ đại trà, căn cứ điểm học bạ.', 
 '8.png', 
 '2025-05-06', 'hung', 130, 'CAT03', 1),

('news08', N'Hà Nội lần đầu dùng bản đồ số để học sinh không nhầm điểm thi', 
 N'Các điểm thi tốt nghiệp THPT kèm thông tin địa điểm, liên lạc, được đưa lên bản đồ trực tuyến để học sinh tra cứu, thuận lợi khi đến trường thi.

Ông Nghiêm Văn Bình, Trưởng phòng Quản lý thi và Kiểm định chất lượng, Sở Giáo dục và Đào tạo, cho biết tin trên, ngày 8/6.

Theo ông, bản đồ dạng này đã được áp dụng trong kỳ thi vào lớp 10 vừa qua, song mới chỉ dành cho ban chỉ đạo thi. Cơ quan chuyên môn đánh giá bản đồ số giúp công tác điều phối, vận chuyển đề diễn ra an toàn, khoa học.

Tới kỳ thi tốt nghiệp THPT diễn ra vào cuối tháng, Hà Nội sẽ phát hành ứng dụng bản đồ số điểm thi để phụ huynh, thí sinh cài đặt trên điện thoại. Khi mở ứng dụng, người dùng chỉ cần bấm vào tên điểm thi, sẽ tra cứu được địa chỉ, số điện thoại trực ban, số phòng thi, thí sinh... và được chỉ đường đến.

"Công cụ này giúp thí sinh dễ dàng di chuyển tới đúng điểm thi, tránh tình trạng đi nhầm điểm mà một số năm vẫn xảy ra", ông nói.Kỳ thi vào lớp 10 công lập ở Hà Nội năm nay có gần 103.000 thí sinh. Hôm qua và sáng nay, các em đã thi xong ba môn chung là Toán, Văn, Anh. Những em thi trường chuyên sẽ làm thêm bài thi vào ngày mai.

Giám đốc Sở Giáo dục và Đào tạo Trần Thế Cương đánh giá kỳ thi về cơ bản an toàn, không có sự cố về đề thi.

Với kỳ thi tốt nghiệp THPT, Hà Nội có hơn 100.000 thí sinh, đông nhất cả nước. Sở đánh giá số lượng thí sinh lớn gây áp lực trong khâu tổ chức, đảm bảo an toàn cho thí sinh và cả kỳ thi. Dùng bản đồ số góp phần giải quyết việc này, cũng như thúc đẩy ứng dụng khoa học công nghệ, đổi mới sáng tạo trong giáo dục.

', 
 '9.png', 
 '2025-06-08', 'hung', 90, 'CAT03', 0),

('news09', N'1 "chọi" 15 vào lớp 6 trường Năng khiếu mới mở ở Hà Nội', 
 N'Hơn 1.600 học sinh cạnh tranh 105 suất vào lớp 6 trường THCS Năng khiếu Đại học Sư phạm, với tỷ lệ chọi là 1/15,6 trong kỳ tuyển sinh đầu tiên của trường.

Từ 7h, điểm thi tại trường THPT chuyên Sư phạm đã đông phụ huynh và học sinh. Thời tiết dịu mát. Nhiều phụ huynh tranh thủ cho con ăn sáng, buộc lại tóc, thủ thỉ động viên hoặc dặn dò, trước khi con vào phòng thi.

Trường này năm nay lần đầu tuyển sinh lớp 6, chỉ tiêu là 105 nhưng nhận được hơn 1.600 hồ sơ đăng ký. Tỷ lệ chọi 1/15,6 là mức cao, khi nhiều năm qua, mức cạnh tranh ở các trường THCS công lập "hot" của thủ đô cũng thường khoảng 1/16-1/20.

Đến từ huyện Đan Phương, chị Nguyễn Minh Tú đưa con gái đến trường từ 6h. Chị cho biết nhóm phụ huynh có con học cùng lớp hẹn nhau đi sớm để tránh tắc đường. Tới nơi, gặp ba bạn cùng lớp ở trường Tiểu học Thị trấn Phùng, con gái chị Tú trò chuyện rôm rả. Cả nhóm túm lại bàn tán, tìm phòng thi và cùng động viên nhau bình tĩnh.

"Con khá thoải mái, tôi cũng không áp lực vì nếu không đỗ vẫn còn trường công gần nhà", chị Tú nói. Chị cho hay trước đó con đã thi trường THCS Ngoại ngữ và THCS và THPT Nguyễn Tất Thành, đang đợi kết quả.

Cả gia đình chị Nguyễn Thị Mai ở quận Thanh Xuân sáng nay cũng dậy sớm đưa con đi thi. Trong lúc đứng đợi bố và em đi gửi xe, cậu bé nói chuyện vui với mẹ. Em cho biết vừa thi trường THCS Thanh Xuân, làm bài tốt nên không lo lắng.

"Đây là năm đầu tiên trường tuyển sinh, tỷ lệ chọi cao nhưng tôi vẫn đăng ký cho con thi xem thế nào", chị Mai nói. Trước ngày thi, con chị làm thử đề minh họa của trường, được hơn 80% nên hy vọng nay sẽ làm bài suôn sẻ. Tuần tới, cậu bé tiếp tục thử sức với các bài thi ở trường THCS Cầu Giấy.Đứng ngoài đợi con, chị Trịnh Thị Dung, quận Bắc Từ Liêm, cho biết con đi ôn Toán từ năm lớp 4 với cường độ nhẹ nhàng, lên lớp 5 học thêm tiếng Việt. Theo chị, các thầy cô cho luyện đề của nhiều trường nhưng THCS Năng khiếu mới mở nên chưa có tài liệu. Con chỉ bám theo dạng đề minh họa để học.

Khi xem thông báo tuyển sinh, chị thấy trường này phù hợp với định hướng phát triển đồng đều cho con của gia đình. Dù vậy, chị không kỳ vọng nhiều.

"Được thì tốt, còn không thì thi cho biết. Tôi không lo lắng vì đã có trường công đúng tuyến", chị Dung chia sẻ.

Nhiều phụ huynh tương tự, với tâm lý đưa con đi thi để "thử sức".

Trường THCS Năng khiếu Đại học Sư phạm được thành lập ngày 28/2, tên tiếng Anh là HNUE Elite Middle School (HEMS).

Ở vòng sơ tuyển, trường xét điểm thi học sinh giỏi, thi tài năng cấp tỉnh trở lên (2-5 điểm, tương đương giải khuyến khích, ba, nhì và nhất) và học bạ (2 điểm mỗi năm với mức hoàn thành tốt, 3 điểm nếu hoàn thành xuất sắc). Đạt tổng cộng từ 12 điểm trở lên, học sinh được vào vòng đánh giá năng lực.

Đề thi vòng này kiểm tra kiến thức văn hóa, nghệ thuật, thể dục thể thao, chủ yếu thuộc chương trình lớp 5. Bài thi trên giấy, với dạng trắc nghiệm kết hợp tự luận, trong 120 phút, điểm tối đa là 100.

Học phí dự kiến của trường THCS Năng khiếu là 4 triệu đồng một tháng.', 
 '10.png', 
 '2025-05-09', 'hai', 210, 'CAT03', 1);

-- Dữ liệu mẫu: NEWSLETTERS
INSERT INTO NEWSLETTERS (Email, Enabled) VALUES
('langochungdev@gmail.com', 1),
('langochungse23@gmail.com', 1),
('reader5@gmail.com', 1),
('reader7@gmail.com', 1);
