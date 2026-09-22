Update: The live Python pipeline has now completed successfully on Linux DEV. It called Symcor, retrieved both cheque images, processed them through Tungsten, and generated CSV, JSON and Excel outputs with exit code 0. TLS verification remained enabled.

DEV required the OS CA bundle for Tungsten because of the corporate TLS proxy. This setting needs to be included in the deployment configuration.

The Python version requirement and packaging details still need to be finalized for CADP. Positive OCR accuracy remains a separate validation item.
