import os

# Define the directories to be created
root = os.getcwd()
directories = ['assets', 'src']
src_directories = ['models', 'screens', 'widgets', 'utils']
assets_directories = ['icons', 'images', 'fonts']
src_widgets = ['transaction_list.dart', 'total_amount.dart', 'pie_chart.dart', 'legend.dart', 'month_summary.dart']
src_models = ['transaction_model.dart', 'month_model.dart', 'category_model.dart', 'feedback_model.dart']
src_screens = ['home_screen.dart', 'pie_chart_screen.dart', 'settings_screen.dart', 'previous_data_screen.dart', 'feedback_screen.dart']
src_utils = ['budget_calculator.dart']
root_files = ['pubspec.yaml', 'main.dart']

# Create the directories
for directory in directories:
    os.mkdir(os.path.join(root, directory))
    print(f"Created directory: {directory}")

src = os.path.join(root, 'src')
for directory in src_directories:
    os.mkdir(os.path.join(src, directory))
    print(f"Created directory: {directory} in src")

assets = os.path.join(root, 'assets')
for directory in assets_directories:
    os.mkdir(os.path.join(assets, directory))
    print(f"Created directory: {directory} in assets")

widgets = os.path.join(src, 'widgets')
for widget in src_widgets:
    open(os.path.join(widgets, widget), 'a').close()
    print(f"Created file: {widget} in widgets")

models = os.path.join(src, 'models')
for model in src_models:
    open(os.path.join(models, model), 'a').close()
    print(f"Created file: {model} in models")

screens = os.path.join(src, 'screens')
for screen in src_screens:
    open(os.path.join(screens, screen), 'a').close()
    print(f"Created file: {screen} in screens")

utils = os.path.join(src, 'utils')
for util in src_utils:
    open(os.path.join(utils, util), 'a').close()
    print(f"Created file: {util} in utils")

for file in root_files:
    open(os.path.join(root, file), 'a').close()
    print(f"Created file: {file} in root")

print("File system created!")
