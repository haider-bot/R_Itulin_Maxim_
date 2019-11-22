using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class alfa2 : MonoBehaviour
{

    public float RayDistenc = 4f;
    public GameObject Human2;
    public GameObject Bot2;
    public string attack1;
    public string Hit;
    public bool Run2;

    private void Awake()
    {

    }

    void Update()
    {

        foreach (Touch touch in Input.touches)
        {
            if (touch.phase == TouchPhase.Began)
            {
                // Construct a ray from the current touch coordinates
                Ray ray = Camera.main.ScreenPointToRay(touch.position);
                RaycastHit hit;
                if (Physics.Raycast(ray, out hit))
                {
                    if (hit.transform.name == "Sphere")
                    {
                        print("wasd");
                        attack1 = "attack01";
                        Human2.GetComponent<Animator>().Play("attack01");

                        print("wasd");
                        Hit = "Hit";
                        Bot2.GetComponent<Animator>().Play("Hit");



                    }
                }
            }
        }


        /*int mask = 1 << 8;
        Debug.DrawRay(transform.position + Vector3.up, transform.forward * 4f, Color.green);
        if (Physics.Raycast(transform.position + transform.up, transform.forward, RayDistenc, mask))
        {
            if (Input.GetKeyDown(KeyCode.C))
            {

                Human.GetComponent<Animation>().Play("attack01"); 
                Bot.GetComponent<Animation>().Play("Hit");
                */
    }
}





