import datetime

# Get user input
due_date_input = raw_input("Due date (dd/mm/yy): ")
start_date_input = raw_input("Start date (dd/mm/yy): ")
number_pages = raw_input("Total pages: ")
current_page = raw_input("Current page: ")
annotations_per_page = raw_input("Number of annotations per page: ")

# Format dates
due_date_d, due_date_m, due_date_y = (int(x) for x in due_date_input.split('/'))
due_date = datetime.date(due_date_y, due_date_m, due_date_d)
if start_date_input == "":
	start_date = datetime.date.today()
else:
	start_date_d, start_date_m, start_date_y = (int(x) for x in start_date_input.split('/'))
	start_date = date(start_date_y, start_date_m, start_date_d)

# Days left
days_left = (due_date - start_date).days
if days_left < 1:
	print "You're out of time."
else:
	print "You have %d days left." % days_left

# Pages to read
pages_left = int(number_pages) - int(current_page)
print "\nReading:"
print "You have %d pages left to read." % pages_left
print "You need to read %d pages per day." % (pages_left / days_left)
print "\nAnnotating:"
print "You have %d annotations left to write" % (int(annotations_per_page) * pages_left)
print "You will have made %d annotations by the end of the book" % (int(annotations_per_page) * int(number_pages))
