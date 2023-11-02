classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        TabGroup                     matlab.ui.container.TabGroup
        NghiemTab                    matlab.ui.container.Tab
        SLnLpTextArea                matlab.ui.control.TextArea
        SLnLpTextAreaLabel           matlab.ui.control.Label
        Label                        matlab.ui.control.Label
        KtQuNghimTextArea            matlab.ui.control.TextArea
        KtQuNghimTextAreaLabel       matlab.ui.control.Label
        NhpSaiSChoPhpEditField       matlab.ui.control.EditField
        NhpSaiSChoPhpEditFieldLabel  matlab.ui.control.Label
        NhpKhongPhnLyNghimEditField  matlab.ui.control.EditField
        NhpKhongPhnLyNghimEditFieldLabel  matlab.ui.control.Label
        NhpPhngTrnhEditField         matlab.ui.control.EditField
        NhpPhngTrnhEditFieldLabel_2  matlab.ui.control.Label
        ChnPhngPhpButtonGroup        matlab.ui.container.ButtonGroup
        PhngPhpTuynTnhButton         matlab.ui.control.ToggleButton
        PhngPhpLpButton              matlab.ui.control.ToggleButton
        PhngPhpChiaiButton           matlab.ui.control.ToggleButton
        UIAxes                       matlab.ui.control.UIAxes
        NoisuyTab                    matlab.ui.container.Tab
        HoiQuyTab                    matlab.ui.container.Tab
        DaoHamTab                    matlab.ui.container.Tab
        TichPhanTab                  matlab.ui.container.Tab
        GioiThieuNhomTab             matlab.ui.container.Tab
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

            % Create ChnPhngPhpButtonGroup
            app.ChnPhngPhpButtonGroup = uibuttongroup(app.NghiemTab);
            app.ChnPhngPhpButtonGroup.Title = 'Chọn Phương Pháp';
            app.ChnPhngPhpButtonGroup.Position = [34 249 371 191];

            % Create PhngPhpChiaiButton
            app.PhngPhpChiaiButton = uitogglebutton(app.ChnPhngPhpButtonGroup);
            app.PhngPhpChiaiButton.Text = 'Phương Pháp Chia Đôi';
            app.PhngPhpChiaiButton.Position = [11 117 351 43];
            app.PhngPhpChiaiButton.Value = true;

            % Create PhngPhpLpButton
            app.PhngPhpLpButton = uitogglebutton(app.ChnPhngPhpButtonGroup);
            app.PhngPhpLpButton.Text = 'Phương Pháp Lặp';
            app.PhngPhpLpButton.Position = [11 67 351 43];

            % Create PhngPhpTuynTnhButton
            app.PhngPhpTuynTnhButton = uitogglebutton(app.ChnPhngPhpButtonGroup);
            app.PhngPhpTuynTnhButton.Text = 'Phương Pháp Tuyến Tính';
            app.PhngPhpTuynTnhButton.Position = [11 16 351 43];

            % Create NhpPhngTrnhEditFieldLabel_2
            app.NhpPhngTrnhEditFieldLabel_2 = uilabel(app.NghiemTab);
            app.NhpPhngTrnhEditFieldLabel_2.HorizontalAlignment = 'right';
            app.NhpPhngTrnhEditFieldLabel_2.Position = [31 615 112 22];
            app.NhpPhngTrnhEditFieldLabel_2.Text = 'Nhập Phương Trình';

            % Create NhpPhngTrnhEditField
            app.NhpPhngTrnhEditField = uieditfield(app.NghiemTab, 'text');
            app.NhpPhngTrnhEditField.Position = [222 606 183 39];

            % Create NhpKhongPhnLyNghimEditFieldLabel
            app.NhpKhongPhnLyNghimEditFieldLabel = uilabel(app.NghiemTab);
            app.NhpKhongPhnLyNghimEditFieldLabel.HorizontalAlignment = 'right';
            app.NhpKhongPhnLyNghimEditFieldLabel.Position = [34 549 173 22];
            app.NhpKhongPhnLyNghimEditFieldLabel.Text = 'Nhập Khoảng Phân Ly Nghiệm ';

            % Create NhpKhongPhnLyNghimEditField
            app.NhpKhongPhnLyNghimEditField = uieditfield(app.NghiemTab, 'text');
            app.NhpKhongPhnLyNghimEditField.Position = [222 540 183 39];

            % Create NhpSaiSChoPhpEditFieldLabel
            app.NhpSaiSChoPhpEditFieldLabel = uilabel(app.NghiemTab);
            app.NhpSaiSChoPhpEditFieldLabel.HorizontalAlignment = 'right';
            app.NhpSaiSChoPhpEditFieldLabel.Position = [34 481 129 22];
            app.NhpSaiSChoPhpEditFieldLabel.Text = 'Nhập Sai Số Cho Phép';

            % Create NhpSaiSChoPhpEditField
            app.NhpSaiSChoPhpEditField = uieditfield(app.NghiemTab, 'text');
            app.NhpSaiSChoPhpEditField.Position = [222 472 183 39];

            % Create KtQuNghimTextAreaLabel
            app.KtQuNghimTextAreaLabel = uilabel(app.NghiemTab);
            app.KtQuNghimTextAreaLabel.BackgroundColor = [1 1 0];
            app.KtQuNghimTextAreaLabel.HorizontalAlignment = 'center';
            app.KtQuNghimTextAreaLabel.FontSize = 14;
            app.KtQuNghimTextAreaLabel.FontWeight = 'bold';
            app.KtQuNghimTextAreaLabel.Position = [34 178 371 22];
            app.KtQuNghimTextAreaLabel.Text = 'Kết Quả Nghiệm';

            % Create KtQuNghimTextArea
            app.KtQuNghimTextArea = uitextarea(app.NghiemTab);
            app.KtQuNghimTextArea.HorizontalAlignment = 'center';
            app.KtQuNghimTextArea.FontSize = 36;
            app.KtQuNghimTextArea.FontWeight = 'bold';
            app.KtQuNghimTextArea.Position = [34 118 371 48];
            app.KtQuNghimTextArea.Value = {'134'};

            % Create Label
            app.Label = uilabel(app.NghiemTab);
            app.Label.Position = [34 208 966 22];
            app.Label.Text = '-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';

            % Create SLnLpTextAreaLabel
            app.SLnLpTextAreaLabel = uilabel(app.NghiemTab);
            app.SLnLpTextAreaLabel.BackgroundColor = [1 1 0];
            app.SLnLpTextAreaLabel.HorizontalAlignment = 'center';
            app.SLnLpTextAreaLabel.FontSize = 14;
            app.SLnLpTextAreaLabel.FontWeight = 'bold';
            app.SLnLpTextAreaLabel.Position = [448 178 552 22];
            app.SLnLpTextAreaLabel.Text = 'Số Lần Lặp';

            % Create SLnLpTextArea
            app.SLnLpTextArea = uitextarea(app.NghiemTab);
            app.SLnLpTextArea.HorizontalAlignment = 'center';
            app.SLnLpTextArea.FontSize = 36;
            app.SLnLpTextArea.FontWeight = 'bold';
            app.SLnLpTextArea.Position = [448 118 552 48];
            app.SLnLpTextArea.Value = {'134'};

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