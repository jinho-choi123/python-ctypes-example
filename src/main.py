import ctypes

def load_library(slib_path):
    try:
        # Load the shared library
        lib = ctypes.CDLL(slib_path)
        return lib
    except OSError as e:
        print(f"Error loading library {slib_path}: {e}")
        return None

def main():
    slib_path = "build/libhelloworld.so"  # Adjust the path as necessary
    lib = load_library(slib_path)
    if lib:
        # Call a function from the library, e.g., `hello_world`
        try:
            lib.main()
        except AttributeError as e:
            print(f"Function not found in library: {e}")

if __name__ == "__main__":
    main()
