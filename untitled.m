function untitled()
    % Hàm chính khởi tạo các thành phần và tính toán trọng tâm của UAV
    % Khởi tạo các thành phần của UAV
    components = initializeComponents();
    % Tính toán trọng tâm của UAV
    cg = calculateCenterOfGravity(components.masses, components.positions);
    % Hiển thị kết quả
    fprintf('Trọng tâm của UAV là: (%.2f, %.2f, %.2f) m\n', cg(1), cg(2), cg(3));
end
function components = initializeComponents()
    % Hàm khởi tạo các thành phần của UAV
    % Trả về một cấu trúc chứa khối lượng và vị trí của các thành phần
    % Khối lượng của các thành phần (đơn vị: kg)
    masses = [5.0, 0.5, 1.0, 0.3, 0.7]; % [mass_body, mass_motor, mass_battery, mass_control, mass_other]
    % Tọa độ của các thành phần (đơn vị: m)
    % Giả sử hệ tọa độ gốc (0,0,0) ở phần đuôi UAV
    positions = [1.5, 0, 0;     % Tọa độ của thân máy bay
                 2.0, 0, 0.2;   % Tọa độ của động cơ
                 1.2, 0, -0.1;  % Tọa độ của pin
                 1.4, 0, 0.1;   % Tọa độ của hệ thống điều khiển
                 1.0, 0, 0];    % Tọa độ của các thành phần khác
    % Lưu trữ khối lượng và vị trí vào một cấu trúc
    components.masses = masses;
    components.positions = positions;
end
function cg = calculateCenterOfGravity(masses, positions)
    % Hàm tính toán trọng tâm của UAV
    % Tham số đầu vào:
    %   - masses: vector chứa khối lượng của các thành phần
    %   - positions: ma trận tọa độ của các thành phần, mỗi hàng tương ứng với một thành phần
    % Kết quả trả về:
    %   - cg: vector tọa độ trọng tâm của UAV
    % Tổng khối lượng UAV
    total_mass = sum(masses);
    % Tính toán tọa độ trọng tâm theo trục x, y, z
    cg_x = sum(masses .* positions(:, 1)) / total_mass;
    cg_y = sum(masses .* positions(:, 2)) / total_mass;
    cg_z = sum(masses .* positions(:, 3)) / total_mass;
    % Trọng tâm của UAV
    cg = [cg_x, cg_y, cg_z];
end
