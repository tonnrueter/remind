import logging
logger = logging.getLogger(__name__)

# This script is for testing purposes only & should be executed FROM AN R SESSION with the following command:

def main():
    # logging.basicConfig(filename='myapp.log', level=logging.INFO)
    logger.info('Started!')
    logger.warning('Warning!')
    logger.error('Error!')
    logger.info('Finished!')
    # raise Warning("This is a warning")

if __name__ == '__main__':
    main()
    print("Printing -- main done")
