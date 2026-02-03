using GenieFramework
@genietools

@app begin
    @out message = "Welcome to juDock"
end

ui() = h1("{{message}}")

@page("/", ui)
Server.up(8000, async=false)