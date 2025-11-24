import os
import shutil
import random
import mysql.connector
from datetime import datetime

DUMMY_IMAGE_FOLDER = r"C:\Users\riyan\OneDrive\Pictures\Screenshots"
UPLOAD_FOLDER = r"D:\workspace_java\e-comerce\uploads"
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "root",
    "database": "ecomerce_db",
}

db = mysql.connector.connect(**DB_CONFIG)
cursor = db.cursor()

os.makedirs(UPLOAD_FOLDER, exist_ok=True)

images_files = [
    f for f in os.listdir(DUMMY_IMAGE_FOLDER) if f.lower().endswith((".jpg", ".jpeg", ".png"))
]

if not images_files:
    raise Exception("Folder tidak punya gambar")

for i in range(20):
    selected_image = random.choice(images_files)
    src_path = os.path.join(DUMMY_IMAGE_FOLDER, selected_image)

    new_filename = f"dummy_{i}_{random.randint(1000, 9999)}.jpg"
    dst_path = os.path.join(UPLOAD_FOLDER, new_filename)
    image_path_for_db = f"/uploads/{new_filename}"

    shutil.copy(src_path, dst_path)

    product_name = f"Produk Dummy {i}"
    product_desc = "Ini adalah produk dummy untuk testing."
    price = random.randint(10000, 500000)
    stock = random.randint(10, 50)
    created_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    cursor.execute("""
        INSERT INTO products (name, description, price,stock, image_path, created_at)
        VALUES (%s, %s, %s, %s, %s, %s)
        """, (product_name, product_desc, price,stock, image_path_for_db, created_at))

db.commit()
print("Sukses generate dummy data + upload image!")

cursor.close()
db.close()



