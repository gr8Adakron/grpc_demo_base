# app.py
from concurrent import futures

import grpc

from generated import demo_pb2_grpc
from grpc_demo import Echoer

# from . import Echoer, echo_pb2_grpc


class Server:

    @staticmethod
    def run():
        print("\t - Starting GRPC Server at http://localhost:5003")
        server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
        demo_pb2_grpc.add_DemoServicer_to_server(Echoer(), server)
        server.add_insecure_port('[::]:5003')
        server.start()
        server.wait_for_termination()

if __name__ == '__main__':
    Server.run()
