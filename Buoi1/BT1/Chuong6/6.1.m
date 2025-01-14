%Mô phỏng một đoạn tín hiệu APG và xác định các giá trị là ngoại lệ nếu chúng có sự sai lệch đáng kể so với giá trị trung bình của mảng dữ liệu.
A = [0.57 0.59 0.60 0.1 0.59 0.58 0.57 0.58 0.3 0.61 0.62 0.60 0.62 0.58 0.57];
TF = isoutlier(A,'mean')