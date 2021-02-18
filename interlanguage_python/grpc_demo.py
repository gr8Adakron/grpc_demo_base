# grpc.py
from generated import demo_pb2, demo_pb2_grpc


class Echoer(demo_pb2_grpc.DemoServicer):

    def Ping(self, request, context):
        acknowledgement = "Hello Source, pong."
        print(f"\n\n - Input received: {request.greet_message}")
        print(f" - Sending Acknowledgement: {acknowledgement}")
        return demo_pb2.Acknowledgement(ackw_message=f'{acknowledgement}')
