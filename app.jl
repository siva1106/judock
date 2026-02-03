using GenieFramework
@genietools

@app begin
    @out message = "juDock Workspace"
    @out drawer_open = true
end

ui() = [
    layout(view="hHh Lpr lFf", [
        # 1. Top Header
        header(class="bg-primary text-white", [
            btn(dense=true, flat=true, round=true, icon="menu", @click("drawer_open = !drawer_open")),
            toolbar_title("juDock Pro")
        ]),

        # 2. Left Sidebar (Library)
        drawer(v__model="drawer_open", side="left", bordered=true, [
            list([
                item(section, "Library"),
                item(clickable=true, v_ripple=true, [
                    item_section(avatar=true, icon="folder"),
                    item_section("My Project")
                ])
            ])
        ]),

        # 3. Main Content (3D View + Right Panel)
        page_container([
            row([
                # Center: 3D Viewer Placeholder
                cell(class="col-8 bg-black", style="height: 90vh; display: flex; align-items: center; justify-content: center;", [
                    h3("3D Viewer (NGL.js) goes here", class="text-white")
                ]),
                # Right: Results/Controls
                cell(class="col-4 bg-grey-2", [
                    h4("Docking Controls", class="q-ma-md"),
                    btn("Run Vina", color="green", class="full-width q-mb-md")
                ])
            ])
        ])
    ])
]

@page("/", ui)
Server.up(8000, async=false)