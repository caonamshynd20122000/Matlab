classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        TabGroup                     matlab.ui.container.TabGroup
        NghiemTab                    matlab.ui.container.Tab
        soLanLap                     matlab.ui.control.TextArea
        BnChnLabel_3                 matlab.ui.control.Label
        kqNghiem                     matlab.ui.control.TextArea
        BnChnLabel_2                 matlab.ui.control.Label
        Label                        matlab.ui.control.Label
        kqPhuongphap                 matlab.ui.control.TextArea
        BnChnLabel                   matlab.ui.control.Label
        saiSo                        matlab.ui.control.EditField
        NhpSaiSChoPhpEditFieldLabel  matlab.ui.control.Label
        khoangPhanLy                 matlab.ui.control.EditField
        NhpKhongPhnLyNghimEditFieldLabel  matlab.ui.control.Label
        phuongTrinh                  matlab.ui.control.EditField
        NhpPhngTrnhEditFieldLabel_2  matlab.ui.control.Label
        phuongPhap                   matlab.ui.container.ButtonGroup
        tuyenTinh                    matlab.ui.control.ToggleButton
        Lap                          matlab.ui.control.ToggleButton
        chiaDoi                      matlab.ui.control.ToggleButton
        UIAxes                       matlab.ui.control.UIAxes
        NoisuyTab                    matlab.ui.container.Tab
        HoiQuyTab                    matlab.ui.container.Tab
        DaoHamTab                    matlab.ui.container.Tab
        TichPhanTab                  matlab.ui.container.Tab
        GioiThieuNhomTab             matlab.ui.container.Tab
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Selection changed function: phuongPhap
        function phuongPhapSelectionChanged(app, event)
            selectedButton = app.phuongPhap.SelectedObject;
            % ================ Đây là nơi làm việc của Thúy Quỳnh =======

            if selectedButton == app.chiaDoi
                % Nếu chọn nút "Phương Pháp Chia Đôi"
                saiSoValue = str2double(app.saiSo.Value);
                gopDoiValue = saiSoValue * 2;
                app.kqNghiem.Value = {num2str(gopDoiValue)};
                app.kqPhuongphap.Value = "Phương Pháp Chia Đôi";
            elseif selectedButton == app.Lap
                % Xử lý khi chọn nút "Phương Pháp Lặp"
                % Thêm code xử lý tại đây
            elseif selectedButton == app.tuyenTinh
                % Xử lý khi chọn nút "Phương Pháp Tuyến Tính"
                % Thêm code xử lý tại đây



            
            % ================ Đây là nơi làm việc của Thúy Quỳnh =======
            end
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1032 729];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 1032 729];

            % Create NghiemTab
            app.NghiemTab = uitab(app.TabGroup);
            app.NghiemTab.Title = 'Nghiệm';

            % Create UIAxes
            app.UIAxes = uiaxes(app.NghiemTab);
            title(app.UIAxes, 'Đồ Thị Phương Trình F(x)')
            xlabel(app.UIAxes, 'Trục Hoành (x)')
            ylabel(app.UIAxes, 'Trục Tung (y)')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [448 249 552 396];

            % Create phuongPhap
            app.phuongPhap = uibuttongroup(app.NghiemTab);
            app.phuongPhap.SelectionChangedFcn = createCallbackFcn(app, @phuongPhapSelectionChanged, true);
            app.phuongPhap.Title = 'Chọn Phương Pháp';
            app.phuongPhap.HandleVisibility = 'off';
            app.phuongPhap.Position = [34 249 371 191];

            % Create chiaDoi
            app.chiaDoi = uitogglebutton(app.phuongPhap);
            app.chiaDoi.Text = 'Phương Pháp Chia Đôi';
            app.chiaDoi.Position = [11 117 351 43];
            app.chiaDoi.Value = true;

            % Create Lap
            app.Lap = uitogglebutton(app.phuongPhap);
            app.Lap.Text = 'Phương Pháp Lặp';
            app.Lap.Position = [11 67 351 43];

            % Create tuyenTinh
            app.tuyenTinh = uitogglebutton(app.phuongPhap);
            app.tuyenTinh.Text = 'Phương Pháp Tuyến Tính';
            app.tuyenTinh.Position = [11 16 351 43];

            % Create NhpPhngTrnhEditFieldLabel_2
            app.NhpPhngTrnhEditFieldLabel_2 = uilabel(app.NghiemTab);
            app.NhpPhngTrnhEditFieldLabel_2.HorizontalAlignment = 'right';
            app.NhpPhngTrnhEditFieldLabel_2.Position = [31 615 112 22];
            app.NhpPhngTrnhEditFieldLabel_2.Text = 'Nhập Phương Trình';

            % Create phuongTrinh
            app.phuongTrinh = uieditfield(app.NghiemTab, 'text');
            app.phuongTrinh.Position = [222 606 183 39];

            % Create NhpKhongPhnLyNghimEditFieldLabel
            app.NhpKhongPhnLyNghimEditFieldLabel = uilabel(app.NghiemTab);
            app.NhpKhongPhnLyNghimEditFieldLabel.HorizontalAlignment = 'right';
            app.NhpKhongPhnLyNghimEditFieldLabel.Position = [34 549 173 22];
            app.NhpKhongPhnLyNghimEditFieldLabel.Text = 'Nhập Khoảng Phân Ly Nghiệm ';

            % Create khoangPhanLy
            app.khoangPhanLy = uieditfield(app.NghiemTab, 'text');
            app.khoangPhanLy.Position = [222 540 183 39];

            % Create NhpSaiSChoPhpEditFieldLabel
            app.NhpSaiSChoPhpEditFieldLabel = uilabel(app.NghiemTab);
            app.NhpSaiSChoPhpEditFieldLabel.HorizontalAlignment = 'right';
            app.NhpSaiSChoPhpEditFieldLabel.Position = [34 481 129 22];
            app.NhpSaiSChoPhpEditFieldLabel.Text = 'Nhập Sai Số Cho Phép';

            % Create saiSo
            app.saiSo = uieditfield(app.NghiemTab, 'text');
            app.saiSo.Position = [222 472 183 39];

            % Create BnChnLabel
            app.BnChnLabel = uilabel(app.NghiemTab);
            app.BnChnLabel.BackgroundColor = [1 1 0];
            app.BnChnLabel.HorizontalAlignment = 'center';
            app.BnChnLabel.FontSize = 14;
            app.BnChnLabel.FontWeight = 'bold';
            app.BnChnLabel.Position = [34 178 371 22];
            app.BnChnLabel.Text = 'Bạn Đã Chọn';

            % Create kqPhuongphap
            app.kqPhuongphap = uitextarea(app.NghiemTab);
            app.kqPhuongphap.Editable = 'off';
            app.kqPhuongphap.HorizontalAlignment = 'center';
            app.kqPhuongphap.FontSize = 18;
            app.kqPhuongphap.FontWeight = 'bold';
            app.kqPhuongphap.Position = [34 134 371 32];

            % Create Label
            app.Label = uilabel(app.NghiemTab);
            app.Label.Position = [34 208 966 22];
            app.Label.Text = '-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';

            % Create BnChnLabel_2
            app.BnChnLabel_2 = uilabel(app.NghiemTab);
            app.BnChnLabel_2.BackgroundColor = [1 1 0];
            app.BnChnLabel_2.HorizontalAlignment = 'center';
            app.BnChnLabel_2.FontSize = 14;
            app.BnChnLabel_2.FontWeight = 'bold';
            app.BnChnLabel_2.Position = [448 178 250 22];
            app.BnChnLabel_2.Text = 'Kết Quả Nghiệm';

            % Create kqNghiem
            app.kqNghiem = uitextarea(app.NghiemTab);
            app.kqNghiem.Editable = 'off';
            app.kqNghiem.HorizontalAlignment = 'center';
            app.kqNghiem.FontSize = 18;
            app.kqNghiem.FontWeight = 'bold';
            app.kqNghiem.Position = [448 134 250 32];

            % Create BnChnLabel_3
            app.BnChnLabel_3 = uilabel(app.NghiemTab);
            app.BnChnLabel_3.BackgroundColor = [1 1 0];
            app.BnChnLabel_3.HorizontalAlignment = 'center';
            app.BnChnLabel_3.FontSize = 14;
            app.BnChnLabel_3.FontWeight = 'bold';
            app.BnChnLabel_3.Position = [748 178 252 22];
            app.BnChnLabel_3.Text = 'Số Lần Lặp';

            % Create soLanLap
            app.soLanLap = uitextarea(app.NghiemTab);
            app.soLanLap.Editable = 'off';
            app.soLanLap.HorizontalAlignment = 'center';
            app.soLanLap.FontSize = 18;
            app.soLanLap.FontWeight = 'bold';
            app.soLanLap.Position = [748 134 252 32];

            % Create NoisuyTab
            app.NoisuyTab = uitab(app.TabGroup);
            app.NoisuyTab.Title = 'Nội Suy';

            % Create HoiQuyTab
            app.HoiQuyTab = uitab(app.TabGroup);
            app.HoiQuyTab.Title = 'Hồi Quy';

            % Create DaoHamTab
            app.DaoHamTab = uitab(app.TabGroup);
            app.DaoHamTab.Title = 'Đạo Hàm';

            % Create TichPhanTab
            app.TichPhanTab = uitab(app.TabGroup);
            app.TichPhanTab.Title = 'Tích Phân';

            % Create GioiThieuNhomTab
            app.GioiThieuNhomTab = uitab(app.TabGroup);
            app.GioiThieuNhomTab.Title = 'Giới Thiệu Nhóm';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
