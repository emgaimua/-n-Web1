-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 13, 2017 lúc 11:30 AM
-- Phiên bản máy phục vụ: 10.1.25-MariaDB
-- Phiên bản PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id_danh_muc` int(20) NOT NULL,
  `ten_danh_muc` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `danh_muc`
--

INSERT INTO `danh_muc` (`id_danh_muc`, `ten_danh_muc`) VALUES
(1, 'core i3'),
(2, 'core i5'),
(3, 'core i7'),
(4, 'core M5'),
(5, 'core pentium'),
(6, 'core coleron');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `id_don_hang` int(20) NOT NULL,
  `id_giao_dich` int(20) NOT NULL,
  `id_san_pham` int(20) NOT NULL,
  `id_nhan_vien` int(20) NOT NULL,
  `tong_tien` float NOT NULL,
  `trang_thai` text CHARACTER SET utf8 NOT NULL,
  `ngay_tao` date NOT NULL,
  `ten_khach_hang` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giao_dich`
--

CREATE TABLE `giao_dich` (
  `id_giao_dich` int(20) NOT NULL,
  `id_khach_hang` int(20) NOT NULL,
  `ten_khach_hang` varchar(50) CHARACTER SET utf8 NOT NULL,
  `phan_hoi` text CHARACTER SET utf8,
  `id_nhan_vien` int(20) NOT NULL,
  `ten_san_pham` varchar(100) CHARACTER SET utf8 NOT NULL,
  `tong_tien` decimal(50,0) NOT NULL,
  `ngay_tao` date NOT NULL,
  `so_dt_khach_hang` int(20) DEFAULT NULL,
  `email_khach_hang` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khach_hang`
--

CREATE TABLE `khach_hang` (
  `id_khach_hang` int(20) NOT NULL,
  `ten_khach_hang` varchar(50) CHARACTER SET utf8 NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 NOT NULL,
  `so_dien_thoai` int(50) NOT NULL,
  `dia_chi` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `khach_hang`
--

INSERT INTO `khach_hang` (`id_khach_hang`, `ten_khach_hang`, `username`, `password`, `email`, `so_dien_thoai`, `dia_chi`) VALUES
(1, 'abc', 'abc', '123', 'abc@gmail.com', 123456789, '235 nguyen'),
(2, 'th', 'hn', '123', 'abc@gmail', 123456789, '23 nguyen'),
(3, 'dfggf', 'sgg', '676839d8697be8f0e37d624e3364268b', 'anc@gmail.com', 0, 'dfggfd'),
(4, 'fgw', 'wefwef', '469410a4d1dbdaaa9a6f5236eeed4258', 'afew@gmail.com', 0, 'efef');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhan_vien`
--

CREATE TABLE `nhan_vien` (
  `id_nhan_vien` int(20) NOT NULL,
  `ten_nhan_vien` varchar(50) CHARACTER SET utf8 NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nha_sx`
--

CREATE TABLE `nha_sx` (
  `id_nsx` int(20) NOT NULL,
  `ten_nsx` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `nha_sx`
--

INSERT INTO `nha_sx` (`id_nsx`, `ten_nsx`) VALUES
(1, 'Dell'),
(2, 'Asus'),
(3, 'HP'),
(4, 'MacBook'),
(5, 'Acer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `id_san_pham` int(20) NOT NULL,
  `id_danh_muc` int(20) NOT NULL,
  `id_nhasx` int(20) NOT NULL,
  `ten_san_pham` varchar(100) CHARACTER SET utf8 NOT NULL,
  `gia_tien` float(50,0) NOT NULL,
  `so_luong` int(20) NOT NULL,
  `giam_gia` int(20) DEFAULT NULL,
  `ngay_tao` date NOT NULL,
  `hinh_anh` varchar(300) NOT NULL,
  `mo_ta` varchar(255) NOT NULL,
  `thong_tin` text CHARACTER SET utf8 NOT NULL,
  `luot_xem` int(50) NOT NULL,
  `so_luong_ban` int(20) NOT NULL,
  `tinh_trang` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id_san_pham`, `id_danh_muc`, `id_nhasx`, `ten_san_pham`, `gia_tien`, `so_luong`, `giam_gia`, `ngay_tao`, `hinh_anh`, `mo_ta`, `thong_tin`, `luot_xem`, `so_luong_ban`, `tinh_trang`) VALUES
(1, 1, 1, 'Laptop Dell Inspiron 3467', 10340000, 4, 10, '2017-11-28', '1.png', 'Laptop Dell Inspiron 3467 trang bị vi xử lý Core i3 thế hệ thứ 7 đem lại hiệu suất làm việc mạnh hơn các thế hệ trước đây, tích hợp với Ram 4 GB và có thể hỗ trợ nâng cấp tối đa 8 GB giúp máy vận hành mượt mà các nhu cầu khác nhau.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i3 Kabylake\r\nLoại CPU	7100U\r\nTốc độ CPU	2.30 GHz\r\nTốc độ tối đa	Không\r\nTốc độ Bus	2400 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	4 GB\r\nLoại RAM	DDR4 (1 khe)\r\nTốc độ Bus RAM	2400 MHz\r\nHỗ trợ RAM tối đa	8 GB\r\nỔ cứng	HDD: 1 TB\r\nMàn hình\r\nKích thước màn hình	14 inch\r\nĐộ phân giải	HD (1366 x 768)\r\nCông nghệ màn hình	Màn hình chống chói, TrueLife LED-Backlit Display\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa tích hợp\r\nCard đồ họa	Intel® HD Graphics 620\r\nCông nghệ âm thanh	Combo Microphone & Headphone\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0\r\nKết nối không dây	Bluetooth v4.0, Wi-Fi 802.11 a/b/g/n\r\nKhe đọc thẻ nhớ	SD, SDXC, SDHC\r\nỔ đĩa quang	Có (đọc, ghi dữ liệu)\r\nWebcam	1 MP, HD webcam\r\nĐèn bàn phím	Không\r\nTính năng khác	Multi TouchPad\r\nPIN\r\nLoại PIN	PIN rời\r\nThông tin Pin	Li-Ion 4 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 345 mm - Ngang 243 mm - Dày 21.4 mm\r\nTrọng lượng	1.77 kg\r\nChất liệu	Vỏ nhựa', 23, 0, 1),
(2, 1, 1, 'Laptop Dell Inspiron 3567', 11690000, 4, NULL, '2017-11-27', '2.png', 'Dell Inspiron 3567 i3 6006U là phiên bản nâng cấp với RAM 4 GB cùng một ổ đĩa quang tiện dụng, là chiếc laptop thích hợp dành cho việc giải trí.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i3 Skylake\r\nLoại CPU	6006U\r\nTốc độ CPU	2.00 GHz\r\nTốc độ tối đa	Không\r\nTốc độ Bus	2400 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	4 GB\r\nLoại RAM	DDR4 (2 khe)\r\nTốc độ Bus RAM	2400 MHz\r\nHỗ trợ RAM tối đa	8 GB\r\nỔ cứng	HDD: 1 TB\r\nMàn hình\r\nKích thước màn hình	15.6 inch\r\nĐộ phân giải	HD (1366 x 768)\r\nCông nghệ màn hình	TrueLife LED-Backlit Display\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa tích hợp\r\nCard đồ họa	Intel® HD Graphics 520\r\nCông nghệ âm thanh	Combo Microphone & Headphone, Loa kép (2 kênh), Waves MaxxAudio\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0\r\nKết nối không dây	Bluetooth v4.0, Wi-Fi 802.11 a/b/g/n\r\nKhe đọc thẻ nhớ	SD, SDHC, SDXC\r\nỔ đĩa quang	Có (đọc, ghi dữ liệu)\r\nWebcam	1 MP, HD webcam\r\nĐèn bàn phím	Không\r\nTính năng khác	Multi TouchPad\r\nPIN\r\nLoại PIN	PIN rời\r\nThông tin Pin	Li-Ion 4 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 380 mm - Ngang 260.3 mm - Dày 23.65 mm\r\nTrọng lượng	2.25 kg\r\nChất liệu	Vỏ nhựa', 29, 0, 1),
(3, 2, 1, 'Laptop Dell Inspiron 5378', 17490000, 1, NULL, '2017-11-21', '3.jpg', 'Dell Inspiron 5378 i5 7200U trang bị chip thế hệ thứ 7 mới, màn hình Full HD sắc nét, khả năng xoay khập kèm màn hình cảm ứng hoàn hảo.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i5 Kabylake\r\nLoại CPU	7200U\r\nTốc độ CPU	2.50 GHz\r\nTốc độ tối đa	Turbo Boost 3.1GHz\r\nTốc độ Bus	2400 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	4 GB\r\nLoại RAM	DDR4 (2 khe)\r\nTốc độ Bus RAM	2400 MHz\r\nHỗ trợ RAM tối đa	8 GB\r\nỔ cứng	SSD: 128 GB\r\nMàn hình\r\nKích thước màn hình	13.3 inch\r\nĐộ phân giải	Full HD (1920 x 1080)\r\nCông nghệ màn hình	TrueLife LED-Backlit Display, Công nghệ IPS, Lật, Xoay 360 độ\r\nMàn hình cảm ứng	Có\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa tích hợp\r\nCard đồ họa	Intel® HD Graphics 620\r\nCông nghệ âm thanh	Loa kép (2 kênh), Waves MaxxAudio, Combo Microphone & Headphone\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	2 x USB 3.0, HDMI, USB 2.0\r\nKết nối không dây	Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac\r\nKhe đọc thẻ nhớ	SD\r\nỔ đĩa quang	Không\r\nWebcam	1 MP, HD webcam\r\nĐèn bàn phím	Có\r\nTính năng khác	Multi TouchPad, Đèn bàn phím\r\nPIN\r\nLoại PIN	PIN liền\r\nThông tin Pin	Li-Ion 3 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 324 mm - Ngang 224.8 mm - Dày 19.5 mm\r\nTrọng lượng	1.62 kg\r\nChất liệu	Vỏ nhựa', 1, 0, 1),
(4, 2, 1, 'Laptop Dell Inspiron 5567', 16790000, 2, NULL, '2017-11-22', '4.png', 'Dell Inspiron 5567 i5 7200U là phiên bản nâng cấp với RAM 4 GB cùng card màn hình rời AMD hỗ trợ lên đến 2 GB, là chiếc laptop thích hợp dành cho việc giải trí.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i5 Kabylake\r\nLoại CPU	7200U\r\nTốc độ CPU	2.50 GHz\r\nTốc độ tối đa	Turbo Boost 3.1GHz\r\nTốc độ Bus	2400 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	4 GB\r\nLoại RAM	DDR4 (2 khe)\r\nTốc độ Bus RAM	2400 MHz\r\nHỗ trợ RAM tối đa	8 GB\r\nỔ cứng	HDD: 1 TB\r\nMàn hình\r\nKích thước màn hình	15.6 inch\r\nĐộ phân giải	Full HD (1920 x 1080)\r\nCông nghệ màn hình	TrueLife LED-Backlit Display\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa rời\r\nCard đồ họa	AMD Radeon R7 M445, 2 GB\r\nCông nghệ âm thanh	Waves MaxxAudio, Loa kép (2 kênh)\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0\r\nKết nối không dây	Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n\r\nKhe đọc thẻ nhớ	SD, SDHC, SDXC\r\nỔ đĩa quang	Có (đọc, ghi dữ liệu)\r\nWebcam	1 MP, HD webcam\r\nĐèn bàn phím	Có\r\nTính năng khác	Multi TouchPad\r\nPIN\r\nLoại PIN	PIN liền\r\nThông tin Pin	Li-Ion 3 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 390 mm - Ngang 259 mm - Dày 23.3 mm\r\nTrọng lượng	2.32 kg\r\nChất liệu	Vỏ nhựa', 0, 0, 1),
(5, 2, 1, 'Laptop Dell Vostro 5568 i5', 17990000, 3, NULL, '2017-11-28', '5.png', 'Dell Vostro 5568 i5 7200U là phiên bản với màn hình lớn hơn 15.6 inch so với Vostro 5468 cùng một cấu hình mạnh mẽ bên trong.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i5 Kabylake\r\nLoại CPU	7200U\r\nTốc độ CPU	2.50 GHz\r\nTốc độ tối đa	Turbo Boost 3.1GHz\r\nTốc độ Bus	2400 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	4 GB\r\nLoại RAM	DDR4 (2 khe)\r\nTốc độ Bus RAM	2400 MHz\r\nHỗ trợ RAM tối đa	16 GB\r\nỔ cứng	HDD: 1 TB\r\nMàn hình\r\nKích thước màn hình	15.6 inch\r\nĐộ phân giải	HD (1366 x 768)\r\nCông nghệ màn hình	Màn hình chống chói, TrueLife LED-Backlit Display\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa rời\r\nCard đồ họa	NVIDIA GeForce 940MX, 2 GB\r\nCông nghệ âm thanh	Combo Microphone & Headphone, Loa kép (2 kênh), Waves MaxxAudio\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	3 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)\r\nKết nối không dây	Bluetooth v4.0, Wi-Fi 802.11 a/b/g/n/ac\r\nKhe đọc thẻ nhớ	SD\r\nỔ đĩa quang	Không\r\nWebcam	1 MP, HD webcam\r\nĐèn bàn phím	Có\r\nTính năng khác	Đèn bàn phím, Multi TouchPad, Fingerprint\r\nPIN\r\nLoại PIN	PIN liền\r\nThông tin Pin	Li-Ion 3 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 380 mm - Ngang 252.5 mm - Dày 19.2 mm\r\nTrọng lượng	1.98 kg\r\nChất liệu	Vỏ nhựa - nắp lưng bằng kim loại', 43, 0, 1),
(6, 3, 1, 'Laptop Dell Inspiron 7460', 23990000, 4, NULL, '2017-11-28', '6.jpg', 'Dell Inspiron 7460 là sản phẩm có thiết kế sang trọng, được nâng cấp với cấu hình rất mạnh, tạo sự thoải mái trong xử lý công việc hay giải trí của bạn.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i7 Kabylake\r\nLoại CPU	7500U\r\nTốc độ CPU	2.70 GHz\r\nTốc độ tối đa	Turbo Boost 3.5 GHz\r\nTốc độ Bus	2400 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	8 GB\r\nLoại RAM	DDR4 (2 khe)\r\nTốc độ Bus RAM	2400 MHz\r\nHỗ trợ RAM tối đa	16 GB\r\nỔ cứng	HDD: 1 TB + SSD: 128GB, M.2\r\nMàn hình\r\nKích thước màn hình	14 inch\r\nĐộ phân giải	Full HD (1920 x 1080)\r\nCông nghệ màn hình	TrueLife LED-Backlit Display\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa rời\r\nCard đồ họa	NVIDIA GeForce 940MX, 2 GB\r\nCông nghệ âm thanh	Waves MaxxAudio, Combo Microphone & Headphone\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0\r\nKết nối không dây	Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac\r\nKhe đọc thẻ nhớ	SD, SDHC, SDXC\r\nỔ đĩa quang	Không\r\nWebcam	1 MP, HD webcam\r\nĐèn bàn phím	Có\r\nTính năng khác	Multi TouchPad\r\nPIN\r\nLoại PIN	PIN liền\r\nThông tin Pin	Li-Ion 3 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 323.3 mm - Ngang 227.1 mm - Dày 18.95 mm\r\nTrọng lượng	1.7 kg\r\nChất liệu	Vỏ kim loại', 7, 0, 1),
(7, 2, 1, 'Laptop Dell Inspiron 7460', 19990000, 2, NULL, '2017-11-23', '7.png', 'Dell Inspiron 7460 ngoài thiết kế vỏ kim loại sang trọng thì còn được nâng cấp với cấu hình rất mạnh, tạo sự thoải mái trong xử lý công việc hay giải trí của bạn.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i5 Kabylake\r\nLoại CPU	7200U\r\nTốc độ CPU	2.50 GHz\r\nTốc độ tối đa	Turbo Boost 3.1GHz\r\nTốc độ Bus	2400 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	4 GB\r\nLoại RAM	DDR4 (2 khe)\r\nTốc độ Bus RAM	2133 MHz\r\nHỗ trợ RAM tối đa	16 GB\r\nỔ cứng	HDD: 500 GB + SSD: 128 GB\r\nMàn hình\r\nKích thước màn hình	14 inch\r\nĐộ phân giải	Full HD (1920 x 1080)\r\nCông nghệ màn hình	Màn hình chống chói, Tấm nền IPS, TrueLife LED-Backlit Display\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa rời\r\nCard đồ họa	NVIDIA GeForce 940MX, 2 GB\r\nCông nghệ âm thanh	Loa kép (2 kênh), Waves MaxxAudio\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0\r\nKết nối không dây	Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac\r\nKhe đọc thẻ nhớ	SD, SDHC, SDXC\r\nỔ đĩa quang	Không\r\nWebcam	1 MP, HD webcam\r\nĐèn bàn phím	Có\r\nTính năng khác	Multi TouchPad\r\nPIN\r\nLoại PIN	PIN liền\r\nThông tin Pin	Li-Ion 3 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 323.3 mm - Ngang 227.1 mm - Dày 18.95 mm\r\nTrọng lượng	1.7 kg\r\nChất liệu	Vỏ kim loại', 1, 0, 1),
(8, 3, 1, 'Laptop Dell Inspiron 7567A', 27590000, 4, NULL, '2017-11-22', '8.jpg', 'Dell Inspiron 7567 i7 7700HQ là dòng sản phẩm cao cấp của hãng, có thế mạnh nâng cao về cấu hình và hiệu suất hoạt động. Đồng thời cũng được Dell ưu ái thiết kế cho một ngoại hình rất hầm hố, mang hơi hướng \"Tàu vũ trụ\" trong các phim giả tưởng.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i7 Kabylake\r\nLoại CPU	7700HQ\r\nTốc độ CPU	2.80 GHz\r\nTốc độ tối đa	Turbo Boost 3.8 GHz\r\nTốc độ Bus	2400 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	8 GB\r\nLoại RAM	DDR4 (2 khe)\r\nTốc độ Bus RAM	2400 MHz\r\nHỗ trợ RAM tối đa	32 GB\r\nỔ cứng	HDD: 500 GB + SSD: 128 GB\r\nMàn hình\r\nKích thước màn hình	15.6 inch\r\nĐộ phân giải	Full HD (1920 x 1080)\r\nCông nghệ màn hình	Màn hình chống chói, TrueLife LED-Backlit Display\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa rời\r\nCard đồ họa	NVIDIA GeForce GTX 1050Ti, 4GB\r\nCông nghệ âm thanh	Waves MaxxAudio, Combo Microphone & Headphone, Loa kép (2 kênh)\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	3 x USB 3.0, HDMI, LAN (RJ45)\r\nKết nối không dây	Bluetooth 4.2, Wi-Fi 802.11 a/b/g/n/ac\r\nKhe đọc thẻ nhớ	SD\r\nỔ đĩa quang	Không\r\nWebcam	0.3 MP\r\nĐèn bàn phím	Có\r\nTính năng khác	Multi TouchPad\r\nPIN\r\nLoại PIN	PIN liền\r\nThông tin Pin	Li-Ion 6 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 384.9 mm - Rộng 274.73 mm - Dày 25.44 mm\r\nTrọng lượng	2.62 kg\r\nChất liệu	Vỏ nhựa', 1, 0, 1),
(9, 2, 1, 'Laptop Dell Vostro 3468', 14490000, 2, NULL, '2017-11-22', '9.png', 'Dell Vostro 3468 i5 7200U là phiên bản rút gọn được trang bị chip xử lý thế hệ mới nhất, bảo mật vân tay cùng ổ cứng HDD lên đến 1 TB.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i5 Kabylake\r\nLoại CPU	7200U\r\nTốc độ CPU	2.50 GHz\r\nTốc độ tối đa	Turbo Boost 3.1GHz\r\nTốc độ Bus	2133 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	4 GB\r\nLoại RAM	DDR4 (2 khe)\r\nTốc độ Bus RAM	2133 MHz\r\nHỗ trợ RAM tối đa	16 GB\r\nỔ cứng	HDD: 1 TB\r\nMàn hình\r\nKích thước màn hình	14 inch\r\nĐộ phân giải	HD (1366 x 768)\r\nCông nghệ màn hình	TrueLife LED-Backlit Display\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa tích hợp\r\nCard đồ họa	Intel® HD Graphics 620\r\nCông nghệ âm thanh	Waves MaxxAudio, Loa kép (2 kênh), Combo Microphone & Headphone\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)\r\nKết nối không dây	Bluetooth v4.0, Wi-Fi 802.11 a/b/g/n\r\nKhe đọc thẻ nhớ	SD, SDHC, SDXC\r\nỔ đĩa quang	Có (đọc, ghi dữ liệu)\r\nWebcam	1 MP, HD webcam\r\nĐèn bàn phím	Không\r\nTính năng khác	Multi TouchPad, Fingerprint\r\nPIN\r\nLoại PIN	PIN rời\r\nThông tin Pin	Li-Ion 4 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 345 mm - Ngang 243 mm - Dày 23.35 mm\r\nTrọng lượng	1.96 kg\r\nChất liệu	Vỏ nhựa', 0, 0, 1),
(10, 3, 1, 'Laptop Dell Vostro 3568', 18490000, 1, NULL, '2017-11-27', '10.png', 'Dell Vostro 3568 i7 7500U có cấu hình rất mạnh cùng tính năng cảm biến vân tay giúp bảo vệ máy bạn tốt hơn.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i7 Kabylake\r\nLoại CPU	7500U\r\nTốc độ CPU	2.70 GHz\r\nTốc độ tối đa	Turbo Boost 3.5 GHz\r\nTốc độ Bus	2133 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	4 GB\r\nLoại RAM	DDR4 (2 khe)\r\nTốc độ Bus RAM	2400 MHz\r\nHỗ trợ RAM tối đa	16 GB\r\nỔ cứng	HDD: 1 TB\r\nMàn hình\r\nKích thước màn hình	15.6 inch\r\nĐộ phân giải	Full HD (1920 x 1080)\r\nCông nghệ màn hình	Màn hình chống chói, TrueLife LED-Backlit Display\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa rời\r\nCard đồ họa	AMD Radeon R5 M420, 2 GB\r\nCông nghệ âm thanh	Waves MaxxAudio, Combo Microphone & Headphone, Loa kép (2 kênh)\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, VGA (D-Sub)\r\nKết nối không dây	Bluetooth v4.0, Wi-Fi 802.11 a/b/g/n\r\nKhe đọc thẻ nhớ	SD\r\nỔ đĩa quang	Có (đọc, ghi dữ liệu)\r\nWebcam	1 MP, HD webcam\r\nĐèn bàn phím	Không\r\nTính năng khác	Fingerprint, Multi TouchPad\r\nPIN\r\nLoại PIN	PIN rời\r\nThông tin Pin	Li-Ion 4 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 380 mm - Rộng 260 mm - Dày 23.65 mm\r\nTrọng lượng	2.18 kg\r\nChất liệu	Vỏ nhựa', 1, 0, 1),
(11, 1, 2, 'Laptop Asus A541UA', 10990000, 2, NULL, '2017-11-27', 'a1.jpg', 'Asus A541UA i3 7100U là phiên bản máy có cấu hình nhẹ hơn, trang bị màn hình Full HD và màn hình lớn lên đến 15.6 inch.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i3 Kabylake\r\nLoại CPU	7100U\r\nTốc độ CPU	2.40 GHz\r\nTốc độ tối đa	Không\r\nTốc độ Bus	2133 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	4 GB\r\nLoại RAM	DDR4 (1 khe)\r\nTốc độ Bus RAM	2133 MHz\r\nHỗ trợ RAM tối đa	8 GB\r\nỔ cứng	HDD: 500 GB\r\nMàn hình\r\nKích thước màn hình	15.6 inch\r\nĐộ phân giải	Full HD (1920 x 1080)\r\nCông nghệ màn hình	Màn hình chống chói, LED Backlit, ASUS Splendid Video\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa tích hợp\r\nCard đồ họa	Intel® HD Graphics 620\r\nCông nghệ âm thanh	Loa kép (2 kênh), SonicMaster audio, Combo Microphone & Headphone\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	HDMI, LAN (RJ45), USB 2.0, USB Type-C, USB 3.0, VGA (D-Sub)\r\nKết nối không dây	Wi-Fi 802.11 a/b/g/n, Bluetooth v4.0\r\nKhe đọc thẻ nhớ	SD, SDXC, SDHC\r\nỔ đĩa quang	Không\r\nWebcam	0.3 MP, VGA Webcam\r\nĐèn bàn phím	Không\r\nTính năng khác	Multi TouchPad\r\nPIN\r\nLoại PIN	PIN liền\r\nThông tin Pin	Li-Ion 3 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 381 mm - Ngang 252 mm - Dày 27.6 mm\r\nTrọng lượng	2.0 kg\r\nChất liệu	Vỏ nhựa', 1, 0, 1),
(12, 3, 2, 'Laptop Asus A556UR', 16990000, 2, NULL, '2017-11-27', 'a2.jpg', 'Laptop Asus A556UR i7 7500U là sản phẩm có cấu hình mạnh trong tầm giá, đủ khả năng đáp ứng hầu hết các nhu cầu sử dụng của người dùng.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i7 Kabylake\r\nLoại CPU	7500U\r\nTốc độ CPU	2.70 GHz\r\nTốc độ tối đa	Turbo Boost 3.5 GHz\r\nTốc độ Bus	2133 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	4 GB\r\nLoại RAM	DDR4 (On board +1 khe)\r\nTốc độ Bus RAM	2133 MHz\r\nHỗ trợ RAM tối đa	12 GB\r\nỔ cứng	HDD: 500 GB\r\nMàn hình\r\nKích thước màn hình	15.6 inch\r\nĐộ phân giải	Full HD (1920 x 1080)\r\nCông nghệ màn hình	Anti-Glare, LED Backlit, ASUS Splendid Video\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa rời\r\nCard đồ họa	NVIDIA GeForce 930MX, 2 GB\r\nCông nghệ âm thanh	Loa kép (2 kênh), Combo Microphone & Headphone, SonicMaster audio\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	HDMI, LAN (RJ45), USB 2.0, USB 3.0, USB Type-C, VGA (D-Sub)\r\nKết nối không dây	Bluetooth v4.0, Wi-Fi 802.11 a/b/g/n\r\nKhe đọc thẻ nhớ	SD, SDXC, SDHC\r\nỔ đĩa quang	Có (đọc, ghi dữ liệu)\r\nWebcam	0.3 MP, VGA Webcam\r\nĐèn bàn phím	Không\r\nTính năng khác	Instant On, Multi TouchPad\r\nPIN\r\nLoại PIN	PIN liền\r\nThông tin Pin	Li-Ion 2 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 382 mm - Ngang 258 mm - Dày 25.5 mm\r\nTrọng lượng	2.3 kg\r\nChất liệu	Vỏ nhựa', 0, 0, 1),
(13, 3, 2, 'Laptop Asus GL553VD', 24990000, 3, NULL, '2017-11-27', 'a3.jpg', 'Asus GL553VD i7 7700HQ là dòng sản phẩm Gaming có thiết kế hầm hố, một cấu hình mạnh, thiết kế tản nhiệt thông minh thách thức mọi tác vụ nặng và được trang bị màn hình Full HD càng giúp \"Game Thủ\" trải nghiệm máy tuyệt vời hơn.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i7 Kabylake\r\nLoại CPU	7700HQ\r\nTốc độ CPU	2.80 GHz\r\nTốc độ tối đa	Turbo Boost 3.8 GHz\r\nTốc độ Bus	2400 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	8 GB\r\nLoại RAM	DDR4 (2 khe)\r\nTốc độ Bus RAM	2400 MHz\r\nHỗ trợ RAM tối đa	32 GB\r\nỔ cứng	HDD: 1 TB, Hỗ trợ khe cắm SSD M.2\r\nMàn hình\r\nKích thước màn hình	15.6 inch\r\nĐộ phân giải	Full HD (1920 x 1080)\r\nCông nghệ màn hình	Màn hình chống chói, Tấm nền IPS, ASUS Splendid Video, LED Backlit\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa rời\r\nCard đồ họa	NVIDIA GeForce GTX 1050, 4GB\r\nCông nghệ âm thanh	Loa kép (2 kênh), Combo Microphone & Headphone\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	2 x USB 3.0, HDMI, LAN (RJ45), USB 2.0, USB Type-C\r\nKết nối không dây	Bluetooth v4.0, Wi-Fi 802.11 a/b/g/n/ac\r\nKhe đọc thẻ nhớ	SD, SDXC, SDHC\r\nỔ đĩa quang	Không\r\nWebcam	1 MP, HD webcam\r\nĐèn bàn phím	Có\r\nTính năng khác	Đèn bàn phím, Multi TouchPad\r\nPIN\r\nLoại PIN	PIN liền\r\nThông tin Pin	Li-Ion 4 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 383 mm - Rộng 255 mm - Dày 30 mm\r\nTrọng lượng	2.5 kg\r\nChất liệu	Vỏ nhựa', 0, 0, 1),
(14, 3, 2, 'Laptop Asus Hero GL503VM', 32490000, 5, NULL, '2017-11-27', 'a4.jpg', 'Asus Gaming GL503VM i7 7700HQ là dòng sản phẩm laptop chơi game khủng có thiết kế hầm hố và đậm chất \"game thủ\" riêng biệt. Máy trang bị cấu hình mạnh, âm thanh vòm sống động giúp mang cảm giác trải nghiệm tuyệt vời, đấm chìm trong các trò chơi.', 'Bộ xử lý\r\nCông nghệ CPU	Intel Core i7 Kabylake\r\nLoại CPU	7700HQ\r\nTốc độ CPU	2.80 GHz\r\nTốc độ tối đa	Turbo Boost 3.8 GHz\r\nTốc độ Bus	2400 MHz\r\nBộ nhớ, RAM, Ổ cứng\r\nRAM	8 GB\r\nLoại RAM	DDR4 (2 khe)\r\nTốc độ Bus RAM	2400 MHz\r\nHỗ trợ RAM tối đa	32 GB\r\nỔ cứng	HDD: 1 TB\r\nMàn hình\r\nKích thước màn hình	15.6 inch\r\nĐộ phân giải	Full HD (1920 x 1080)\r\nCông nghệ màn hình	120Hz, Tấm nền IPS, Màn hình chống chói, ASUS Splendid Video, LED Backlit\r\nMàn hình cảm ứng	Không\r\nĐồ họa và Âm thanh\r\nThiết kế card	Card đồ họa rời\r\nCard đồ họa	NVIDIA GeForce GTX1060, 3GB\r\nCông nghệ âm thanh	SonicMaster audio, Combo Microphone & Headphone, Loa kép (2 kênh)\r\nCổng kết nối & tính năng mở rộng\r\nCổng giao tiếp	4 x USB 3.0, HDMI, LAN (RJ45), Mini DisplayPort, USB Type-C\r\nKết nối không dây	Bluetooth 4.1, Wi-Fi 802.11 a/b/g/n/ac\r\nKhe đọc thẻ nhớ	SD, SDXC, SDHC\r\nỔ đĩa quang	Không\r\nWebcam	1 MP, HD webcam\r\nĐèn bàn phím	Có\r\nTính năng khác	Đèn bàn phím đổi màu, Multi TouchPad\r\nPIN\r\nLoại PIN	PIN liền\r\nThông tin Pin	Li-Ion 4 cell\r\nHệ điều hành\r\nHệ điều hành	Windows 10\r\nKích thước & trọng lượng\r\nKích thước	Dài 383.54 mm - Rộng 261.6 mm - Dày 23 mm\r\nTrọng lượng	2.3 kg\r\nChất liệu	Vỏ nhựa', 0, 0, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id_danh_muc`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id_don_hang`),
  ADD KEY `dhang_gdich` (`id_giao_dich`),
  ADD KEY `dhang_spham` (`id_san_pham`),
  ADD KEY `dhang_nvien` (`id_nhan_vien`);

--
-- Chỉ mục cho bảng `giao_dich`
--
ALTER TABLE `giao_dich`
  ADD PRIMARY KEY (`id_giao_dich`),
  ADD KEY `gdich_khang` (`id_khach_hang`),
  ADD KEY `gdich_nvien` (`id_nhan_vien`);

--
-- Chỉ mục cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`id_khach_hang`);

--
-- Chỉ mục cho bảng `nhan_vien`
--
ALTER TABLE `nhan_vien`
  ADD PRIMARY KEY (`id_nhan_vien`);

--
-- Chỉ mục cho bảng `nha_sx`
--
ALTER TABLE `nha_sx`
  ADD PRIMARY KEY (`id_nsx`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id_san_pham`),
  ADD KEY `spham_dmuc` (`id_danh_muc`),
  ADD KEY `spham_nsx` (`id_nhasx`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id_danh_muc` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id_don_hang` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `giao_dich`
--
ALTER TABLE `giao_dich`
  MODIFY `id_giao_dich` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  MODIFY `id_khach_hang` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `nhan_vien`
--
ALTER TABLE `nhan_vien`
  MODIFY `id_nhan_vien` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `nha_sx`
--
ALTER TABLE `nha_sx`
  MODIFY `id_nsx` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id_san_pham` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `dhang_gdich` FOREIGN KEY (`id_giao_dich`) REFERENCES `giao_dich` (`id_giao_dich`),
  ADD CONSTRAINT `dhang_spham` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id_san_pham`);

--
-- Các ràng buộc cho bảng `giao_dich`
--
ALTER TABLE `giao_dich`
  ADD CONSTRAINT `gdich_khang` FOREIGN KEY (`id_khach_hang`) REFERENCES `khach_hang` (`id_khach_hang`),
  ADD CONSTRAINT `gdich_nvien` FOREIGN KEY (`id_nhan_vien`) REFERENCES `nhan_vien` (`id_nhan_vien`);

--
-- Các ràng buộc cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `spham_danhmuc` FOREIGN KEY (`id_danh_muc`) REFERENCES `danh_muc` (`id_danh_muc`),
  ADD CONSTRAINT `spham_nsx` FOREIGN KEY (`id_nhasx`) REFERENCES `nha_sx` (`id_nsx`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
