# -*- coding: utf-8 -*-
"""
Created on Apr 09 2024
Last updated on Oct 27 2024

@author: Olivia Ashmoore
@author: Travis Franck
"""

import os
import sys
import pandas as pd
from enum import Enum
import argparse
import curses
## Curses is installed by default on macOS/Linux. For Windows, install:
#          python -m pip install windows-curses


# --------------------------------------------------------
# The string value should be the path relative to first directory
class MenuChoices(Enum):
    CHOICE_CANCEL = r"Cancel"
    CHOICE_All = r"All of InputData"
    CHOICE_ADD_OUTPUTS = r"add-outputs"
    CHOICE_BLDGS = r"bldgs"
    CHOICE_CCS = r"ccs"
    CHOICE_COUT_OUTPUTS = r"cost-outputs"
    CHOICE_CROSS_SEC = r"cross-sec-tot"
    CHOICE_CTRL = r"ctrl-settings"
    CHOICE_DIST_HEAT = r"dist-heat"
    CHOICE_ELEC = r"elec"
    CHOICE_ENDO_LEARN = r"endo-learn"
    CHOICE_FUELS = r"fuels"
    CHOICE_GEOENG = r"geoeng"
    CHOICE_H2 = r"hydgn"
    CHOICE_INDST = r"indst"
    CHOICE_IO = r"io-model"
    CHOICE_LAND = r"land"
    CHOICE_PLCY = r"plcy-schd"
    CHOICE_TRANS = r"trans"
    CHOICE_WEB_APP = r"web-app"

# --------------------------------------------------------
# Function to present the user with a menu of folder options
def present_menu(stdscr):
        # Clear screen
        stdscr.clear()

        # List of choices from the enum
        choices = [choice.value for choice in MenuChoices]
        current_row = 0

        # Function to print the menu
        def print_menu(stdscr, selected_row_idx):
            stdscr.clear()
            for idx, row in enumerate(choices):
                if idx == selected_row_idx:
                    stdscr.attron(curses.color_pair(1))
                    stdscr.addstr(idx, 0, row)
                    stdscr.attroff(curses.color_pair(1))
                else:
                    stdscr.addstr(idx, 0, row)
            stdscr.refresh()

        # Initialize colors
        curses.curs_set(0)
        curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_WHITE)

        print_menu(stdscr, current_row)

        while True:
            key = stdscr.getch()

            if key == curses.KEY_UP and current_row > 0:
                current_row -= 1
            elif key == curses.KEY_DOWN and current_row < len(choices) - 1:
                current_row += 1
            elif key == curses.KEY_ENTER or key in [10, 13]:
                return choices[current_row]

            print_menu(stdscr, current_row)

# --------------------------------------------------------
# Function to set the root_path after a menu selection
def set_root_path(selection):
    if selection == MenuChoices.CHOICE_All.value:
        # print(f"You selected {selection}")
        return "InputData"
    else:
        # print(f"You selected {selection}")
        # BUGBUG: use join() to make OS independent
        return os.path.join("InputData", selection)


# --------------------------------------------------------
# Function to export tabs from an Excel file to CSV
def export_tabs_to_csv(excel_file_path, tabs_to_export, output_dir):
    try:
        # Open the Excel file
        pd.ExcelFile(excel_file_path)

        for tab_name in tabs_to_export:
            try:
                # Read the specific tab (worksheet) into a DataFrame
                df = pd.read_excel(excel_file_path, sheet_name=tab_name)

                # Round all values in the DataFrame to the 10th significant figure
                # Note: for some small values (e.g., fuel taxes) rounding to 6 looses data and changes model results
                df = df.round(10)

                # Define the CSV file path where you want to save the data
                csv_file_path = os.path.join(output_dir, f"{tab_name}.csv")

                # Export the DataFrame to a CSV file
                df.to_csv(csv_file_path, index=False)

                print(f"{tab_name} from {excel_file_path} exported to {csv_file_path}")
            except Exception as e:
                print(
                    f"Error exporting {tab_name} from {excel_file_path} to CSV: {str(e)}"
                )
    except Exception as e:
        print(f"Error opening Excel file {excel_file_path}: {str(e)}")


# --------------------------------------------------------
# main()

# Check to see if the user passed in a choice already when calling the script
parser = argparse.ArgumentParser(description="EPS data export script to create CSV files.")
parser.add_argument("-m","--menu_choice", type=str, help="A menu choice allowing for non-interactive use", choices=[choice.value for choice in MenuChoices])
parser.add_argument("-d","--dirpath", type=str, help="Arbitrary path to directory with subfolders of Excel files")
args = parser.parse_args()

if args.dirpath:
    root_directory = args.dirpath
elif args.menu_choice:
    root_directory = set_root_path(args.menu_choice)
else:
    # Present a menu and set the path to the XLS/CSV files
    selected_choice = curses.wrapper(present_menu)
    if selected_choice == MenuChoices.CHOICE_CANCEL.value:
        print("Canceling CSV export")
        sys.exit(0)
    else:
        root_directory = set_root_path(selected_choice)
print("Processing files in " + root_directory)


# Recursively search for Excel files in subdirectories
for root, dirs, files in os.walk(root_directory):
    for file in files:
        if file.endswith(".xlsx") or file.endswith(".xls"):
            excel_file_path = os.path.join(root, file)

            # Find existing CSV files in the same directory
            csv_files = [f for f in os.listdir(root) if f.endswith(".csv")]

            # Extract tab names from existing CSV file names
            tabs_to_export = [os.path.splitext(csv_file)[0] for csv_file in csv_files]

            # Call the export function, passing the output directory as the current directory
            export_tabs_to_csv(excel_file_path, tabs_to_export, root)
