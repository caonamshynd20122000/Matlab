classdef project_team < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        ConBoCon                      matlab.ui.Figure
        FileMenu                      matlab.ui.container.Menu
        HomeMenu                      matlab.ui.container.Menu
        TabGroup                      matlab.ui.container.TabGroup
        nghiemTab                     matlab.ui.container.Tab
        NhpPhngTrnhEditFieldLabel     matlab.ui.control.Label
        phuongTrinh                   matlab.ui.control.EditField
        NhpKhongPhnLyNghimEditFieldLabel  matlab.ui.control.Label
        phanLyNghiem                  matlab.ui.control.NumericEditField
        SaiSChoPhpEditFieldLabel      matlab.ui.control.Label
        saiSo                         matlab.ui.control.NumericEditField
        phuongPhap                    matlab.ui.container.ButtonGroup
        chiaDoi                       matlab.ui.control.ToggleButton
        Lap                           matlab.ui.control.ToggleButton
        tuyenTInh                     matlab.ui.control.ToggleButton
        Label                         matlab.ui.control.Label
        UIAxes                        matlab.ui.control.UIAxes
        ChnTextAreaLabel              matlab.ui.control.Label
        kqChon                        matlab.ui.control.TextArea
        NghimCaPhngTrnhTextAreaLabel  matlab.ui.control.Label
        kqNghiem                      matlab.ui.control.TextArea
        SLnLpTextAreaLabel            matlab.ui.control.Label
        kqSoLanLap                    matlab.ui.control.TextArea
        noiSuyTab                     matlab.ui.container.Tab
        hoiQuyTab                     matlab.ui.container.Tab
        daoHamTab                     matlab.ui.container.Tab
        tichPhanTab                   matlab.ui.container.Tab
        GioiThieuNhomTab              matlab.ui.container.Tab
        GreenFETTeamLabel             matlab.ui.control.Label
        Button                        matlab.ui.control.Button
        Button_2                      matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Selection changed function: phuongPhap
        function phuongPhapSelectionChanged(app, event)
            selectedButton = app.phuongPhap.SelectedObject;
        % Day la thuan toan cua Thuy Quynh
        
        
        % Day la thuan toan cua Thuy Quynh
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create ConBoCon and hide until all components are created
            app.ConBoCon = uifigure('Visible', 'off');
            app.ConBoCon.Position = [100 100 675 480];
            app.ConBoCon.Name = 'UI Figure';

            % Create FileMenu
            app.FileMenu = uimenu(app.ConBoCon);
            app.FileMenu.Text = 'File';

            % Create HomeMenu
            app.HomeMenu = uimenu(app.ConBoCon);
            app.HomeMenu.Text = 'Home';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.ConBoCon);
            app.TabGroup.Position = [1 1 675 480];

            % Create nghiemTab
            app.nghiemTab = uitab(app.TabGroup);
            app.nghiemTab.Title = 'Nghiệm';

            % Create NhpPhngTrnhEditFieldLabel
            app.NhpPhngTrnhEditFieldLabel = uilabel(app.nghiemTab);
            app.NhpPhngTrnhEditFieldLabel.Position = [15 402 120 30];
            app.NhpPhngTrnhEditFieldLabel.Text = 'Nhập Phương Trình';

            % Create phuongTrinh
            app.phuongTrinh = uieditfield(app.nghiemTab, 'text');
            app.phuongTrinh.Position = [200 402 120 30];

            % Create NhpKhongPhnLyNghimEditFieldLabel
            app.NhpKhongPhnLyNghimEditFieldLabel = uilabel(app.nghiemTab);
            app.NhpKhongPhnLyNghimEditFieldLabel.Position = [15 353 170 30];
            app.NhpKhongPhnLyNghimEditFieldLabel.Text = 'Nhập Khoảng Phân Ly Nghiệm';

            % Create phanLyNghiem
            app.phanLyNghiem = uieditfield(app.nghiemTab, 'numeric');
            app.phanLyNghiem.Position = [200 353 120 30];

            % Create SaiSChoPhpEditFieldLabel
            app.SaiSChoPhpEditFieldLabel = uilabel(app.nghiemTab);
            app.SaiSChoPhpEditFieldLabel.Position = [15 304 170 30];
            app.SaiSChoPhpEditFieldLabel.Text = 'Sai Số Cho Phép';

            % Create saiSo
            app.saiSo = uieditfield(app.nghiemTab, 'numeric');
            app.saiSo.Position = [200 304 120 30];

            % Create phuongPhap
            app.phuongPhap = uibuttongroup(app.nghiemTab);
            app.phuongPhap.SelectionChangedFcn = createCallbackFcn(app, @phuongPhapSelectionChanged, true);
            app.phuongPhap.Tooltip = {''};
            app.phuongPhap.Title = 'Chọn Phương Pháp';
            app.phuongPhap.HandleVisibility = 'off';
            app.phuongPhap.Position = [14 154 306 127];

            % Create chiaDoi
            app.chiaDoi = uitogglebutton(app.phuongPhap);
            app.chiaDoi.Text = 'Phương Pháp Chia Đôi';
            app.chiaDoi.Position = [11 74 287 22];
            app.chiaDoi.Value = true;

            % Create Lap
            app.Lap = uitogglebutton(app.phuongPhap);
            app.Lap.Text = 'Phương Pháp Lặp';
            app.Lap.Position = [11 43 287 22];

            % Create tuyenTInh
            app.tuyenTInh = uitogglebutton(app.phuongPhap);
            app.tuyenTInh.Text = 'Phương Pháp Tuyến Tính';
            app.tuyenTInh.Position = [11 14 287 22];

            % Create Label
            app.Label = uilabel(app.nghiemTab);
            app.Label.Position = [14 122 660 22];
            app.Label.Text = '-------------------------------------------------------------------------------------------------------------------------------------------------------------------';

            % Create UIAxes
            app.UIAxes = uiaxes(app.nghiemTab);
            title(app.UIAxes, 'ĐỒ THỊ HÀM SỐ')
            xlabel(app.UIAxes, 'x')
            ylabel(app.UIAxes, 'y')
            app.UIAxes.Position = [327 154 338 278];

            % Create ChnTextAreaLabel
            app.ChnTextAreaLabel = uilabel(app.nghiemTab);
            app.ChnTextAreaLabel.HorizontalAlignment = 'center';
            app.ChnTextAreaLabel.Position = [61 92 57 31];
            app.ChnTextAreaLabel.Text = 'Đã Chọn';

            % Create kqChon
            app.kqChon = uitextarea(app.nghiemTab);
            app.kqChon.Editable = 'off';
            app.kqChon.Position = [15 60 150 33];

            % Create NghimCaPhngTrnhTextAreaLabel
            app.NghimCaPhngTrnhTextAreaLabel = uilabel(app.nghiemTab);
            app.NghimCaPhngTrnhTextAreaLabel.HorizontalAlignment = 'center';
            app.NghimCaPhngTrnhTextAreaLabel.Position = [263 89 150 31];
            app.NghimCaPhngTrnhTextAreaLabel.Text = 'Nghiệm Của Phương Trình';

            % Create kqNghiem
            app.kqNghiem = uitextarea(app.nghiemTab);
            app.kqNghiem.Editable = 'off';
            app.kqNghiem.Position = [263 57 150 33];

            % Create SLnLpTextAreaLabel
            app.SLnLpTextAreaLabel = uilabel(app.nghiemTab);
            app.SLnLpTextAreaLabel.HorizontalAlignment = 'center';
            app.SLnLpTextAreaLabel.Position = [515 92 150 31];
            app.SLnLpTextAreaLabel.Text = 'Số Lần Lặp';

            % Create kqSoLanLap
            app.kqSoLanLap = uitextarea(app.nghiemTab);
            app.kqSoLanLap.Editable = 'off';
            app.kqSoLanLap.Position = [515 60 150 33];

            % Create noiSuyTab
            app.noiSuyTab = uitab(app.TabGroup);
            app.noiSuyTab.Title = 'Nội Suy';

            % Create hoiQuyTab
            app.hoiQuyTab = uitab(app.TabGroup);
            app.hoiQuyTab.Title = 'Hồi Quy';

            % Create daoHamTab
            app.daoHamTab = uitab(app.TabGroup);
            app.daoHamTab.Title = 'Đạo Hàm';

            % Create tichPhanTab
            app.tichPhanTab = uitab(app.TabGroup);
            app.tichPhanTab.Title = 'Tích Phân';

            % Create GioiThieuNhomTab
            app.GioiThieuNhomTab = uitab(app.TabGroup);
            app.GioiThieuNhomTab.Title = 'Giới Thiệu Nhóm';

            % Create GreenFETTeamLabel
            app.GreenFETTeamLabel = uilabel(app.GioiThieuNhomTab);
            app.GreenFETTeamLabel.HorizontalAlignment = 'center';
            app.GreenFETTeamLabel.FontSize = 30;
            app.GreenFETTeamLabel.FontWeight = 'bold';
            app.GreenFETTeamLabel.FontColor = [0 1 0];
            app.GreenFETTeamLabel.Position = [191 408 235 37];
            app.GreenFETTeamLabel.Text = 'GreenFET Team';

            % Create Button
            app.Button = uibutton(app.GioiThieuNhomTab, 'push');
            app.Button.Position = [558 252 51 22];
            app.Button.Text = {'>'; ''};

            % Create Button_2
            app.Button_2 = uibutton(app.GioiThieuNhomTab, 'push');
            app.Button_2.Position = [32 252 51 22];
            app.Button_2.Text = '<';

            % Show the figure after all components are created
            app.ConBoCon.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = project_team

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.ConBoCon)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.ConBoCon)
        end
    end
end
