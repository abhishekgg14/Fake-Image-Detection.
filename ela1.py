from PIL import Image, ImageChops

from prediction_file import predict

def error_level_analysis(image_path, quality=90):
    """
    Perform Error Level Analysis (ELA) on the input image.

    Args:
    - image_path (str): Path to the input image file.
    - quality (int): JPEG quality level for saving the temporary image.

    Returns:
    - ela_image (PIL.Image): ELA image.
    """
    # Open the original image
    original_image = Image.open(image_path)

    # Save the original image with the specified quality
    original_image.save("temp.jpg", quality=quality)

    # Open the saved image (reloaded version)
    reloaded_image = Image.open("temp.jpg")

    # Compute the difference between the original and reloaded images
    ela_image = ImageChops.difference(original_image, reloaded_image)

    # Convert the difference image to grayscale
    ela_image = ela_image.convert('L')

    return ela_image


def detect_deepfake(image_path, quality=90, threshold=10):
    """
    Detect potential deepfake using Error Level Analysis (ELA).

    Args:
    - image_path (str): Path to the input image file.
    - quality (int): JPEG quality level for saving the temporary image.
    - threshold (int): Threshold for identifying potential manipulation.

    Returns:
    - is_deepfake (bool): True if the image is identified as a potential deepfake, False otherwise.
    """
    # Perform Error Level Analysis
    ela_result = error_level_analysis(image_path, quality)

    # Calculate error level
    error_level = calculate_error_level(ela_result)
    print("error_level",error_level)
    # Compare error level with the threshold
    is_deepfake = error_level > threshold

    return (is_deepfake,error_level)


def calculate_error_level(ela_image):
    """
    Calculate the error level of the ELA image.

    Args:
    - ela_image (PIL.Image): ELA image.

    Returns:
    - error_level (float): Average pixel intensity of the ELA image.
    """
    # Calculate the average pixel intensity of the ELA image
    pixel_values = list(ela_image.getdata())
    avg_pixel_intensity = sum(pixel_values) / len(pixel_values)

    return avg_pixel_intensity


def predict_fn(image_path):
    # Replace 'your_image.jpg' with the path to your image
    # image_path = r'C:\Users\abhis\PycharmProjects\FakeImageDetection\557468-JimCarrey-1370101103.jpeg'

    # Adjust these parameters as needed
    quality_level = 90
    threshold_level = 10

    # Detect deepfake
    is_deepfake,el = detect_deepfake(image_path, quality=quality_level, threshold=threshold_level)
    print(el,"{{{{{{{{{{{{{{{{{{{{{")

    res=predict(image_path)
    print(res)
    if(res==1):
        return ("Real",el)
    else:
        return("Fake",el)