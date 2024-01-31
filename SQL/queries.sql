-- Query 1
SELECT 
	E.id, 
	name, 
	COUNT(*) AS no_of_sales_invoices
FROM 
	NHAN_VIEN AS E, 
	SALES_INVOICES AS S
WHERE 
	E.id = S.id 
	AND position = 'Sales'
GROUP BY E.id, name;
GO

-- Query 2
SELECT 
	NLK.Ten, 
	LK.Ten 
FROM 
	NHOM_LINH_KIEN AS NLK, 
	LINH_KIEN AS LK 
WHERE 
	NLK.MaNLK = LK.MaNLK 
	AND NLK.MaNLK = 'NLK01';
	GO

-- Query 3
SELECT 
	HDN.MaHDN, 
    Ten, 
    Soluongnhap 
FROM 
	HOA_DON_NHAP AS HDN, 
    LK_HDN, 
    LINH_KIEN AS LK 
WHERE 
    HDN.MaHDN = LK_HDN.MaHDN 
    AND LK_HDN.MaLK = LK.MaLK 
    AND Soluongnhap >= 500
    AND Ngaynhap BETWEEN '2022-01-01' AND '2022-06-30'
ORDER BY Soluongnhap DESC, Ten;
GO

-- Query 4
SELECT 
	KH.MaKH, 
	KH.Ten AS TenKH, 
	LK.Ten AS TenLK, 
	SUM(Soluongxuat) AS TongSLX 
FROM 
	KHACH_HANG AS KH, 
	HOA_DON_XUAT AS HDX, 
	LK_HDX, 
	LINH_KIEN AS LK 
WHERE 
	KH.MaKH = HDX.MaKH 
	AND HDX.MaHDX = LK_HDX.MaHDX 
	AND LK_HDX.MaLK = LK.MaLK 
	AND Gioitinh = 'Nam'
	AND Ngaysinh >= '2000-01-01'
GROUP BY KH.MaKH, KH.Ten, LK.Ten
ORDER BY TenKH, TongSLX DESC;
GO

-- Query 5
SELECT 
	TOP 3 
	CONCAT(Ho, ' ',Tenlot, ' ', KH.Ten) AS TenKH, 
	SUM(Soluongxuat*Giaban) AS SoTienKHChi
FROM 
	KHACH_HANG AS KH 
	INNER JOIN HOA_DON_XUAT AS HDX 
		ON KH.MaKH = HDX.MaKH 
	INNER JOIN LK_HDX 
		ON HDX.MaHDX = LK_HDX.MaHDX 
	INNER JOIN LINH_KIEN AS LK 
		ON LK_HDX.MaLK = LK.MaLK 
WHERE 
	Ngayxuat >= '2022-07-01'
	AND Diachi LIKE '%TP. HCM%'
GROUP BY CONCAT(Ho, ' ',Tenlot, ' ', KH.Ten) 
ORDER BY SoTienKHChi DESC;
GO