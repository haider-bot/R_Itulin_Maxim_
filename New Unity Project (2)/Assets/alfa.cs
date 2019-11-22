using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class alfa : MonoBehaviour
{

    public float RayDistenc = 4f;
    public GameObject Human;
    public GameObject Bot;
    public string Hit;
    public string skill1;
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
                        Hit = "hit";
                        Human.GetComponent<Animator>().Play("hit");

                        print("wasd");
                        skill1 = "skill1";
                        Bot.GetComponent<Animator>().Play("Skill1");



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

                Human.GetComponent<Animation>().Play("hit"); 
                Bot.GetComponent<Animation>().Play("skill1");
                */
    }
}   
        
        
    






   
